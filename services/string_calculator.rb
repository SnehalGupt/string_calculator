class StringCalculator
  def self.add(input)
    delimiter = /,|\n/
    if input.start_with?("//")
      header, input = input.split("\n", 2)
      custom_delim = header[2]
      delimiter = Regexp.escape(custom_delim)
    end

    numbers = input.split(/#{delimiter}/).map(&:strip).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }

    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.sum
  end
end
