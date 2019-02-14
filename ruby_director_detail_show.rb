#!/usr/bin/ruby

require 'pg'
require 'pry'
require 'uri'
require 'net/http'
require 'active_support/all'
require 'sinatra'
# set :bind, '192.168.5.71'
set :bind, '0.0.0.0'
set :port, 9494

Tilt.register Tilt::ERBTemplate, 'html.erb'

def herb(template, options={}, locals={})
  render "html.erb", template, options, locals
end

get '/' do
	begin
	  	con = PG.connect :dbname => 'director_detail', :user => 'postgres', :password => 'postgres'
	  	director_details = con.exec "SELECT * FROM directors_4"
	  	a = []
	  	director_details.each do |detail|
	  		director = JSON.parse(detail["data"])
	  		if (director["return"]["companyOrg1"] != nil)
	  			# puts director["return"]["companyOrg1"] 
	  			a << detail
	  			# "<h1>director['return']['companyOrg1']</h1>".html_safe
	  		end
	  	end
	  	# puts director_details
	rescue PG::Error => e

	    puts e.message 
	    
	ensure
	    con.close if con
	end
	  erb :index, :locals => {:director_details => a}
end

get '/director_detail' do
	din_no = params["din_no"]
	con = PG.connect :dbname => 'director_detail', :user => 'postgres', :password => 'postgres'
	query_value = con.exec "SELECT * FROM directors_4 WHERE din_no = #{din_no}"
	director_detail =  JSON.parse(query_value.first["data"])["return"]
    erb :show, :locals => {:director_details => director_detail,:din_no => query_value.first["din_no"]}
end