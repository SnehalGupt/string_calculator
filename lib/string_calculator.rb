module StringCalculator
  class Calculator
    def add(numbers)
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

      number_list.sum
    end
  end
end