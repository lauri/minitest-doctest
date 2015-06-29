## minitest-doctest

Generate tests from code comments and run them with Minitest. It's like Python's doctest for Ruby.

### Example

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

```
$ minidoctest calculator.rb

Run options: --seed 59837

# Running:

..

Finished in 0.001274s, 1569.8587 runs/s, 2354.7881 assertions/s.

2 runs, 3 assertions, 0 failures, 0 errors, 0 skips
```

### Usage

Add to Gemfile:

```ruby
# Gemfile
gem "minitest-doctest", github: "lauri/minitest-doctest"
```

To test a single file you can use the executable `minidoctest`:

`$ bundle exec minidoctest calculator.rb`

To test a bunch of files you can create a Rake task and use FileList:

```ruby
# Rakefile
require "minitest/doctest"
require "minitest/autorun"

task :doctest do
  f = FileList["*.rb"]
  Minitest::Doctest.run(f)
end
```

This works fine when the files you're testing are self-contained. If they are not you'll get an error when minitest-doctest tries to `require` the file. In this case you'll have to work out requiring all the necessary files yourself and pass `false` as the second argument to `Minitest::Doctest.run`.

With Rails you can just create a Rake task which loads up the environment like this:

```ruby
# lib/tasks/doctest.rake
task doctest: :environment do
  Rails.env = "test"
  require "minitest/doctest"
  require "minitest/autorun"

  f = FileList["#{Rails.root}/**/*.rb"]
  Minitest::Doctest.run(f, false)
end
```

### License
This content is released under the [MIT License](http://opensource.org/licenses/MIT).
