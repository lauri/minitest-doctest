require 'minitest/doctest/parser'
require 'minitest/doctest/runner'
require 'minitest/doctest/version'

module Minitest
  module Doctest
    def self.run(files)
      Array(files).each { |file| Runner.new(file).run }
    end
  end
end
