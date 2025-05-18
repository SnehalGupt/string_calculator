class CalculatorController < ApplicationController
  def index
    if params[:numbers].present?
      @input = params[:numbers]

      begin
        @result = calculate_sum(@input)
      rescue => e
        @error = e.message
      end
    end
  end

  private

  def calculate_sum(input)
    delimiter = /,|\n/  # default

    if input.start_with?("//")
      header, rest = input.split("\n", 2)
      custom_delim = header[2]  # e.g., from "//;\n"
      delimiter = Regexp.escape(custom_delim)
      input = rest || ""
    end

    # Convert to array of integers
    numbers = input.split(/#{delimiter}/).map(&:strip).map(&:to_i)

    # Check for negatives
    negatives = numbers.select { |n| n < 0 }
    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    numbers.sum
  end
end
