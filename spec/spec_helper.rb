require 'minitest/autorun'
require 'minitest/spec'

require_relative '../lib/minitest/doctest'

FILE = File.expand_path("../calculator.rb", __FILE__)
SOURCE = File.read(FILE)

require FILE