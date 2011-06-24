
class Format
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

	def encode(person_data)		
		@data="#{person_data.name},#{person_data.phone_number}"
	end
	
	def decode(data_object)
		name,phno=data_object.split(/,/)
		Person.new(name,phno)
	end

end
class Pdf <Format
end
class Txt <Format
end


def get_subclasses(klass)
	subclasses=ObjectSpace.enum_for(:each_object,class << klass;self;end).to_a
	subclasses.delete(klass)
	subclasses
end

#get_subclasses(Format).each {|format| puts format.class}
puts gets.delete("\n")
