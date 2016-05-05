require 'minitest/autorun'

require 'ratcage'

class RatecageTest < Minitest::Test
  def test_say_hello
    assert_equal("Hello World", Ratcage.new.say_hello)
  end
end