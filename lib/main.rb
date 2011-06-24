require 'person'
require 'format'

def get_person_details_from_user(person)
	get_person_details(person,$stdin) {|attribute| print "Enter your #{attribute.to_s.delete('@')} : "}
end

def get_person_details(person,source)
	inputs_to_get = person.instance_variables
	inputs_to_get.each do |attribute| 
		attribute_name=:"#{attribute}"
		yield attribute_name if block_given?
		person.instance_variable_set(attribute_name,source.gets.delete("\n").strip) 		
	end		
end

def get_subclasses(klass)
	subclasses=ObjectSpace.enum_for(:each_object,class << klass;self;end).to_a
	subclasses.delete(klass)
	subclasses
end

def save_person_details(person)
	print "\nDo you want to save this details to a file?(y/n)"
	option =gets.delete("\n")
	puts option
	if option=='y' then
		filename=person.name.sub(" ","_")
		format=choose_format
		format.new.write_to_file(filename,person)
	end
end

def choose_format
	format_list=get_subclasses(Format)
	puts "\nList of supported Formats"
	format_list.each_index { |index| puts "#{index+1}. #{format_list[index].new.format_name}"}
	print "\nChoose a file format (1-#{format_list.count}): "
	format_list[$stdin.gets.to_i-1]
end

def main
	person1=Person.new
	get_person_details_from_user(person1)
	save_person_details(person1)
	puts "Saved to file successfully"
end

main
