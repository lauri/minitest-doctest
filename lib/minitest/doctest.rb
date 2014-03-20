require 'minitest/doctest/parser'
require 'minitest/doctest/runner'
require 'minitest/doctest/version'

module Minitest
  module Doctest
    def self.run(files, require_file=true)
      Array(files).each { |file| Runner.new(file).run(require_file) }
    end
  end
end
