#$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'main'
require 'test/unit'

class TestMain < Test::Unit::TestCase
	def test_main
		#assert_not_nil(main)
		#assert_instance_of(Person,main)
	end
	
	def test_get_subclasses				
		assert_equal([CSV],get_subclasses(Format))
	end	
	
	def test_choose_format
		
	end

end
