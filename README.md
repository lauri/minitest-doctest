## minitest-doctest

```ruby
# calculator.rb
class Calculator

  # Adds the given numbers together.
  #
  # >> Calculator.add(1, 2)
  # => 3
  # >> Calculator.add(1, 10, 100, 1000)
  # => 1111
  #
  # Returns nil if the given arguments don't add up nicely.
  #
  # >> Calculator.add(:a, 42)
  # => nil
  def self.add(*numbers)
    numbers.inject(:+)
  rescue
    nil
  end
end
```

### Usage

Add to Gemfile:

```
Gemfile
gem 'minitest-doctest', github: "lauri/minitest-doctest`
```

To test a single file you can use the executable `minidoctest`:

`$ bundle exec minidoctest calculator.rb`

To test a bunch of files you can create a Rake task and use FileList:

```
# Rakefile
require 'minitest/doctest'
require 'minitest/autorun'

task :doctest do
  f = FileList["app/**/*.rb"]
  Minitest::Doctest.run(f)
end
```