require 'minitest'

module Minitest
  module Doctest
    class Runner
      attr_reader :test_class, :test_strings

      def initialize(file)
        @file = file
        @test_class = Class.new(Minitest::Test)
        @test_strings = Parser.new(File.read(file)).parse
      end

      def run
        define_tests
        require File.join(Dir.pwd, @file)
      end

      def define_tests
        @test_strings.each { |str| @test_class.class_eval(str) }
      end
    end
  end
end
