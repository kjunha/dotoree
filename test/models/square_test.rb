require 'test_helper'

class SquareTest < ActiveSupport::TestCase
  test "valid square" do
    square = FactoryBot.build :square
    assert square.valid?
  end
  
  test "invalid square without name" do
    square = FactoryBot.build :square
    square.name = nil
    
    refute square.valid?
  end
  
  test "invalid square without user" do
    square = FactoryBot.build :square
    square.user = nil
    
    refute square.valid?
  end
end
