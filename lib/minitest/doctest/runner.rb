require "minitest"

module Minitest
  module Doctest
    class Runner
      attr_reader :test_class

      def initialize(file_path)
        @file_path = file_path
        @test_class = Class.new(Minitest::Test)
        @test_class.define_singleton_method(:to_s) { file_path }
        @test_strings = Parser.new(File.read(file_path)).parse
      end

      def run(require_file)
        define_tests
        require File.absolute_path(@file_path) if require_file
      end

      def define_tests
        @test_strings.each { |str| @test_class.class_eval(str) }
      end
    end
  end
end
