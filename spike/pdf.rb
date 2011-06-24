#require 'pdf/writer'

require 'prawn'
class Format

		@@format_name=""
		@@format_extension=""
	def format_name
		@@format_name
	end
	
	def format_extension
		@@format_extension
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

		@@format_name="Comma Seperated Values"
		@@format_extension=".csv"
		@@data=""

	def encode(person_data)		
		@data="#{person_data.name},#{person_data.phone_number}"
	end
	
	def decode(data_object)
		name,phno=data_object.split(/,/)
		Person.new(name,phno)
	end

end

class Pdf < Format

		@format_name="Portable Document File"
		@format_extension=".pdf"
		@data=""


	def encode(person_data)	
			
		@data="#{person_data.name},#{person_data.phone_number}"
	end

	def decode(data_object)
		name,phno=data_object.split(/,/)
		Person.new(name,phno)
	end

end
class Txt < Format
	class << self
		@sample
		def sample
			@Sample
		end
	end
end



def get_subclasses(klass)
	subclasses=ObjectSpace.enum_for(:each_object,class << klass;self;end).to_a
	subclasses.delete(klass)
	subclasses
end

#get_subclasses(Format).each {|format| puts format.class}
#puts gets.delete("\n")

puts Txt.sample
Prawn::Document.generate("test.pdf") do
  font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
  text "this is a test " * 100
end

