require_relative "spec_helper"

describe Minitest::Doctest::Parser do
  before do
    @parser = Minitest::Doctest::Parser.new(SOURCE)
    @blocks = @parser.blocks
  end

  it "should find the doctest comment blocks" do
    @blocks.size.must_equal 2
    @blocks[0].lines.size.must_equal 4
    @blocks[1].lines.size.must_equal 2
  end

  it "should create expression and assertion lines from blocks" do
    lines = @blocks.map { |block| @parser.test_lines(block) }
    lines[0][0].must_equal "_ = Calculator.add(1, 2)"
    lines[0][1].must_equal "assert_equal(3, _)"
    lines[0][2].must_equal "_ = Calculator.add(1, 10, 100, 1000)"
    lines[0][3].must_equal "assert_equal(1111, _)"
    lines[1][0].must_equal "_ = Calculator.add(:a, 42)"
    lines[1][1].must_equal "assert_equal(nil, _)"
  end

  it "should create test string from lines" do
    test = @parser.test_string(@parser.test_lines(@blocks[1]), 1)
    test.must_match /\s*def test_1$\s*_ = Calculator.add\(:a, 42\)$\s*assert_equal\(nil, _\)$\s*end/
  end
end
