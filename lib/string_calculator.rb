module StringCalculator
  class Calculator
    def initialize
      @called_count = 0  # Track the number of times Add() is called
    end

    def add(numbers)
      @called_count += 1  # Increment the count each time Add() is invoked

      # The rest of your add logic goes here...
      return 0 if numbers.strip.empty?

      delimiters = [",", "\n"]

      # Custom delimiter support
      if numbers.start_with?("//")
        header, numbers = numbers.split("\n", 2)
        custom_delimiter = header[2..]
        delimiters << custom_delimiter
      end

      pattern = Regexp.union(delimiters)
      number_list = numbers.split(pattern).map(&:to_i)

      negatives = number_list.select { |n| n < 0 }
      if negatives.any?
        raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}"
      end

      # Return the sum if no negatives
      number_list.sum
    end

    def get_called_count
      @called_count  # Return the number of times Add() was called
    end
  end
end