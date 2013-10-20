require_relative 'spec_helper'

describe Minitest::Doctest::Runner do
  before do
    @runner = Minitest::Doctest::Runner.new(FILE)
  end

  it "should define test methods to test class" do
    @runner.define_tests
    test = @runner.test_class.new("test")
    test.must_respond_to :test_0
    test.must_respond_to :test_1
  end
end
