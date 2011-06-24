
class Format
	attr_accessor :format_name,:format_extension		

	def initialize
		@format_name=""
		@format_extension=""
	end
	
	def encode(person_data)
		
	end
	
	def decode
			
	end

	def write_to_file(filename,person)		
		encode(person)
		File.open("#{filename}""#{@format_extension}","w").print(@data)
	end

	def read_from_file(filename)
		str=File.open(filename,"w").read
		decode(str)
	end
end

class CSV < Format
		
	def initialize		
		@format_name="Comma Seperated Values"
		@format_extension=".csv"
		@data=""
	end

	def format_name
		@format_name
	end
	
	def format_extension
		@format_extension
	end			
	
	def encode(person_data)		
		@data="#{person_data.name},#{person_data.phone_number}"
	end
	
	def decode(data_object)
		name,phno=data_object.split(/,/)
		Person.new(name,phno)
	end
end

class Pdf < Format

	def initialize	
		@format_name="Portable Document File"
		@format_extension=".pdf"
		@data=""
	end

	def encode(person_data)		
		@data="#{person_data.name},#{person_data.phone_number}"
	end

	def decode(data_object)
		name,phno=data_object.split(/,/)
		Person.new(name,phno)
	end
end




