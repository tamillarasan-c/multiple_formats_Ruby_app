#$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'main'
require 'test/unit'

class TestMain < Test::Unit::TestCase
	def test_get_input_from_user
		person1=Person.new				
		get_person_details_from_user(person1)
		assert_equal('name',person1.name)
		assert_equal('phno',person1.phone_number)
	end
end
