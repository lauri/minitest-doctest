require "minitest/doctest/parser"
require "minitest/doctest/runner"
require "minitest/doctest/version"

module Minitest
  module Doctest
    def self.run(file_paths, require_file=true)
      Array(file_paths).each { |f| Runner.new(f).run(require_file) }
    end
  end
end
