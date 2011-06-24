#$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'person'
require 'test/unit'

class TestPersonInitialization < Test::Unit::TestCase
	def test_initialization 
		inputs=['name','phno']
		person_list=[	Person.new,
				Person.new(inputs[0]),
				Person.new(inputs[0],inputs[1])	]

		person_list.each { |person| assert_instance_of(Person,person)}		
		assert_equal(inputs[0],person_list[1].name)
		assert_equal(inputs[0],person_list[2].name)
		assert_equal(inputs[1],person_list[2].phone_number)
	end
end
