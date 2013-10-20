### minitest-doctest

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

# $ minidoctest calculator.rb
# 
# Run options: --seed 59837
# 
# # Running:
# 
# ..
# 
# Finished in 0.001274s, 1569.8587 runs/s, 2354.7881 assertions/s.
# 
# 2 runs, 3 assertions, 0 failures, 0 errors, 0 skips
```

#### Usage

Add to Gemfile:

```ruby
# Gemfile
gem 'minitest-doctest', github: "lauri/minitest-doctest`
```

To test a single file you can use the executable `minidoctest`:

`$ bundle exec minidoctest calculator.rb`

To test a bunch of files you can create a Rake task and use FileList:

```ruby
# Rakefile
require 'minitest/doctest'
require 'minitest/autorun'

task :doctest do
  f = FileList["app/**/*.rb"]
  Minitest::Doctest.run(f)
end
```