#!/usr/bin/ruby

require 'pg'
require 'pry'
require 'uri'
require 'net/http'
require 'active_support/all'


begin
  
    con = PG.connect :dbname => 'director_detail', :user => 'postgres', :password => 'postgres'

	url = URI("http://115.114.108.120/FOServicesWeb/NCAPrefillService")

	http = Net::HTTP.new(url.host, url.port)
	http.use_ssl = (url.scheme == "https")
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	request = Net::HTTP::Post.new(url)
	request["content-type"] = 'text/xml'
	request["Cache-Control"] = 'no-cache'
	request["postman-token"] = '063095f3-50de-7b18-e8d2-29951da7ccda'
	request["User-Agent"] = "Mozilla/3.0 (compatible; Spider 1.0; Windows)"
	count = 0
	id = 0
	(400000..499999).each do |i|
		count = count + 1;
		id = id + 1 ;
		case i.to_s.length
		when 1
			request.body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n\n   <soap:Body>\n\n      <tns:getNCAPrefillDetails xmlns:tns=\"http://ncaprifill.org/wsdl\">\n\n         <NCAPrefillProcessorDTO>\n\n            <callID>DIN</callID>\n\n            <formID>ZI01</formID>\n\n            <input/>\n\n            <panPassport>0000000#{i}</panPassport>\n\n            <sid>NCA</sid>\n\n         </NCAPrefillProcessorDTO>\n\n      </tns:getNCAPrefillDetails>\n\n   </soap:Body>\n\n</soap:Envelope>"
				response = http.request(request)
				puts "#{i}"
				data = Hash.from_xml(response.read_body)["Envelope"]["Body"]["getNCAPrefillDetailsResponse"].to_json
				if data.present?
					con.exec "INSERT INTO directors_4 VALUES(0000000#{i},'#{data}')"
				end
		when 2
			request.body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n\n   <soap:Body>\n\n      <tns:getNCAPrefillDetails xmlns:tns=\"http://ncaprifill.org/wsdl\">\n\n         <NCAPrefillProcessorDTO>\n\n            <callID>DIN</callID>\n\n            <formID>ZI01</formID>\n\n            <input/>\n\n            <panPassport>000000#{i}</panPassport>\n\n            <sid>NCA</sid>\n\n         </NCAPrefillProcessorDTO>\n\n      </tns:getNCAPrefillDetails>\n\n   </soap:Body>\n\n</soap:Envelope>"
				response = http.request(request)
				puts "#{i}"
				data = Hash.from_xml(response.read_body)["Envelope"]["Body"]["getNCAPrefillDetailsResponse"].to_json
				if data.present?
					con.exec "INSERT INTO directors_4 VALUES(000000#{i},'#{data}')"
				end
		when 3
			request.body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n\n   <soap:Body>\n\n      <tns:getNCAPrefillDetails xmlns:tns=\"http://ncaprifill.org/wsdl\">\n\n         <NCAPrefillProcessorDTO>\n\n            <callID>DIN</callID>\n\n            <formID>ZI01</formID>\n\n            <input/>\n\n            <panPassport>00000#{i}</panPassport>\n\n            <sid>NCA</sid>\n\n         </NCAPrefillProcessorDTO>\n\n      </tns:getNCAPrefillDetails>\n\n   </soap:Body>\n\n</soap:Envelope>"
				response = http.request(request)
				puts "#{i}"
				data = Hash.from_xml(response.read_body)["Envelope"]["Body"]["getNCAPrefillDetailsResponse"].to_json
				if data.present?
					con.exec "INSERT INTO directors_4 VALUES(00000#{i},'#{data}')"
				end
		when 4
			request.body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n\n   <soap:Body>\n\n      <tns:getNCAPrefillDetails xmlns:tns=\"http://ncaprifill.org/wsdl\">\n\n         <NCAPrefillProcessorDTO>\n\n            <callID>DIN</callID>\n\n            <formID>ZI01</formID>\n\n            <input/>\n\n            <panPassport>0000#{i}</panPassport>\n\n            <sid>NCA</sid>\n\n         </NCAPrefillProcessorDTO>\n\n      </tns:getNCAPrefillDetails>\n\n   </soap:Body>\n\n</soap:Envelope>"
				begin
					response = http.request(request)
					puts "#{i}"
					data = Hash.from_xml(response.read_body.gsub("'",""))["Envelope"]["Body"]["getNCAPrefillDetailsResponse"].to_json
					if data.present?
						con.exec "INSERT INTO directors_4 VALUES(0000#{i},'#{data}')"
					end
				rescue
					puts "Sleep For 20 Seconds"
					sleep(20)
				end
		when 5
			request.body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n\n   <soap:Body>\n\n      <tns:getNCAPrefillDetails xmlns:tns=\"http://ncaprifill.org/wsdl\">\n\n         <NCAPrefillProcessorDTO>\n\n            <callID>DIN</callID>\n\n            <formID>ZI01</formID>\n\n            <input/>\n\n            <panPassport>000#{i}</panPassport>\n\n            <sid>NCA</sid>\n\n         </NCAPrefillProcessorDTO>\n\n      </tns:getNCAPrefillDetails>\n\n   </soap:Body>\n\n</soap:Envelope>"
				begin
					response = http.request(request)
					puts "#{i}"
					data = Hash.from_xml(response.read_body.gsub("'",""))["Envelope"]["Body"]["getNCAPrefillDetailsResponse"].to_json
					if data.present?
						con.exec "INSERT INTO directors_4 VALUES(000#{i},'#{data}')"
					end
				rescue
					puts "Sleep For 20 Seconds"
					sleep(20)
				end
		when 6
			request.body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n\n   <soap:Body>\n\n      <tns:getNCAPrefillDetails xmlns:tns=\"http://ncaprifill.org/wsdl\">\n\n         <NCAPrefillProcessorDTO>\n\n            <callID>DIN</callID>\n\n            <formID>ZI01</formID>\n\n            <input/>\n\n            <panPassport>00#{i}</panPassport>\n\n            <sid>NCA</sid>\n\n         </NCAPrefillProcessorDTO>\n\n      </tns:getNCAPrefillDetails>\n\n   </soap:Body>\n\n</soap:Envelope>"
			begin
				response = http.request(request)
				puts "#{i}"
				data = Hash.from_xml(response.read_body.gsub("'",""))["Envelope"]["Body"]["getNCAPrefillDetailsResponse"].to_json
				if data.present?
					con.exec "INSERT INTO directors_4 VALUES(#{id},00#{i},'#{data}')"
				end
			rescue
				puts "Sleep for 20 seconds"
				sleep(20)
			end
		when 7
			request.body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n\n   <soap:Body>\n\n      <tns:getNCAPrefillDetails xmlns:tns=\"http://ncaprifill.org/wsdl\">\n\n         <NCAPrefillProcessorDTO>\n\n            <callID>DIN</callID>\n\n            <formID>ZI01</formID>\n\n            <input/>\n\n            <panPassport>0#{i}</panPassport>\n\n            <sid>NCA</sid>\n\n         </NCAPrefillProcessorDTO>\n\n      </tns:getNCAPrefillDetails>\n\n   </soap:Body>\n\n</soap:Envelope>"
				response = http.request(request)
				puts "#{i}"
				data = Hash.from_xml(response.read_body.gsub("'",""))["Envelope"]["Body"]["getNCAPrefillDetailsResponse"].to_json
				if data.present?
					con.exec "INSERT INTO directors_4 VALUES(0#{i},'#{data}')"
				end
		else
			zeros = ""
		end
		# if count == 20
		# 	puts "Sleep For twenty seconds"
		# 	sleep(20)
		# 	count = 0;
		# end
		# if i.to_s.length == 1
		# 	request.body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n\n   <soap:Body>\n\n      <tns:getNCAPrefillDetails xmlns:tns=\"http://ncaprifill.org/wsdl\">\n\n         <NCAPrefillProcessorDTO>\n\n            <callID>DIN</callID>\n\n            <formID>ZI01</formID>\n\n            <input/>\n\n            <panPassport>0000000#{i}</panPassport>\n\n            <sid>NCA</sid>\n\n         </NCAPrefillProcessorDTO>\n\n      </tns:getNCAPrefillDetails>\n\n   </soap:Body>\n\n</soap:Envelope>"
		# elsif i.to_s.length == 2
		# 	request.body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n\n   <soap:Body>\n\n      <tns:getNCAPrefillDetails xmlns:tns=\"http://ncaprifill.org/wsdl\">\n\n         <NCAPrefillProcessorDTO>\n\n            <callID>DIN</callID>\n\n            <formID>ZI01</formID>\n\n            <input/>\n\n            <panPassport>000000#{i}</panPassport>\n\n            <sid>NCA</sid>\n\n         </NCAPrefillProcessorDTO>\n\n      </tns:getNCAPrefillDetails>\n\n   </soap:Body>\n\n</soap:Envelope>"	
		# end
		# response = http.request(request)
		# puts "#{zeros}#{i}"
		# data = Hash.from_xml(response.read_body)["Envelope"]["Body"]["getNCAPrefillDetailsResponse"].to_json
		# if data.present?
		# 	con.exec "INSERT INTO directors VALUES(#{zeros}#{i},'#{data}')"
		# end
	end
	# (10000000..99999999).each do |i|
	# 	request.body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n\n   <soap:Body>\n\n      <tns:getNCAPrefillDetails xmlns:tns=\"http://ncaprifill.org/wsdl\">\n\n         <NCAPrefillProcessorDTO>\n\n            <callID>DIN</callID>\n\n            <formID>ZI01</formID>\n\n            <input/>\n\n            <panPassport>#{i}</panPassport>\n\n            <sid>NCA</sid>\n\n         </NCAPrefillProcessorDTO>\n\n      </tns:getNCAPrefillDetails>\n\n   </soap:Body>\n\n</soap:Envelope>"
	# 	response = http.request(request)
	# 	data = Hash.from_xml(response.read_body)["Envelope"]["Body"]["getNCAPrefillDetailsResponse"].to_json
	# 	data_1 = Hash.from_xml(response.read_body)["Envelope"]["Body"]["getNCAPrefillDetailsResponse"]
	# 	if (data.present?) 
	# 		if data_1["return"]["messageDtails"]["messageText"] == "#{i} is not valid"
	# 		puts "#{i}"
	# 			con.exec "INSERT INTO directors VALUES(#{i},'#{data}')"
	# 		end
	# 	end
	# end
rescue PG::Error => e

    puts e.message 
    
ensure
    con.close if con
end