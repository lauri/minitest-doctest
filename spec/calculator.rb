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
