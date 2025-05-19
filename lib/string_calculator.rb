module StringCalculator
  class Calculator
    def add(numbers)
    return 0 if numbers.strip.empty?
    delimiters = [",", "\n"]
    # Check for custom delimiter
    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..] # grab everything after "//"
      delimiters << custom_delimiter
    end
    # Build regex pattern to split by any of the delimiters
    pattern = Regexp.union(delimiters)
    numbers.split(pattern).map(&:to_i).sum
  end
  end
end