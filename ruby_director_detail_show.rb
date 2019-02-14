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

# def herb(template, options={}, locals={})
#   render "html.erb", template, options, locals
# end

get '/' do
    erb :home
end

get '/000000-099999' do
	begin
	  	con = PG.connect :dbname => 'director_detail', :user => 'postgres', :password => 'postgres'
	  	director_details = con.exec "SELECT * FROM directors"
	  	a = []
	  	director_details.each do |detail|
	  		director = JSON.parse(detail["data"])
	  		if (director["return"]["companyOrg1"] != nil)
	  			a << detail
	  		end
	  	end
	  	db = "directors";
	  	# puts director_details
	rescue PG::Error => e

	    puts e.message 
	    
	ensure
	    con.close if con
	end
	  erb :index, :locals => {:director_details => a,db: db}
end

get '/100000-199999' do
	begin
	  	con = PG.connect :dbname => 'director_detail', :user => 'postgres', :password => 'postgres'
	  	director_details = con.exec "SELECT * FROM directors_1"
	  	a = []
	  	director_details.each do |detail|
	  		director = JSON.parse(detail["data"])
	  		if (director["return"]["companyOrg1"] != nil)
	  			a << detail
	  		end
	  	end
	  	db = "directors_1";
	  	# puts director_details
	rescue PG::Error => e

	    puts e.message 
	    
	ensure
	    con.close if con
	end
	  erb :index, :locals => {:director_details => a,db: db}
end

get '/200000-299999' do
	begin
	  	con = PG.connect :dbname => 'director_detail', :user => 'postgres', :password => 'postgres'
	  	director_details = con.exec "SELECT * FROM directors_2"
	  	a = []
	  	director_details.each do |detail|
	  		director = JSON.parse(detail["data"])
	  		if (director["return"]["companyOrg1"] != nil)
	  			a << detail
	  		end
	  	end
	  	db = "directors_2";
	  	# puts director_details
	rescue PG::Error => e

	    puts e.message 
	    
	ensure
	    con.close if con
	end
	  erb :index, :locals => {:director_details => a,db: db}
end

get '/300000-399999' do
	begin
	  	con = PG.connect :dbname => 'director_detail', :user => 'postgres', :password => 'postgres'
	  	director_details = con.exec "SELECT * FROM directors_3"
	  	a = []
	  	director_details.each do |detail|
	  		director = JSON.parse(detail["data"])
	  		if (director["return"]["companyOrg1"] != nil)
	  			a << detail
	  		end
	  	end
	  	db = "directors_3";
	  	# puts director_details
	rescue PG::Error => e

	    puts e.message 
	    
	ensure
	    con.close if con
	end
	  erb :index, :locals => {:director_details => a,db: db}
end

get '/400000-499999' do
	begin
	  	con = PG.connect :dbname => 'director_detail', :user => 'postgres', :password => 'postgres'
	  	director_details = con.exec "SELECT * FROM directors_4"
	  	a = []
	  	director_details.each do |detail|
	  		director = JSON.parse(detail["data"])
	  		if (director["return"]["companyOrg1"] != nil)
	  			a << detail
	  		end
	  	end
	  	db = "directors_4";
	  	# puts director_details
	rescue PG::Error => e

	    puts e.message 
	    
	ensure
	    con.close if con
	end
	  erb :index, :locals => {:director_details => a,db: db}
end

get '/director_detail' do
	begin
		con = PG.connect :dbname => 'director_detail', :user => 'postgres', :password => 'postgres'
		unless params[:db] == "directors" 
			query_value = con.exec "SELECT * FROM #{params[:db]} WHERE din_no = #{params[:din_no]}"
		else
			query_value = con.exec "SELECT * FROM #{params[:db]} WHERE id = #{params[:id]}"
		end
		director_detail =  JSON.parse(query_value.first["data"])["return"]
	rescue PG::Error => e

	    puts e.message 
	    
	ensure
	    con.close if con
	end
    erb :show, :locals => {:director_details => director_detail,:din_no => query_value.first["din_no"]}
end