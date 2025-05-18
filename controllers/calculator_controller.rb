class CalculatorController < ApplicationController
  def index
    @result = nil
    if params[:numbers]
      @result = add(params[:numbers])
    end
  end

  private

  def add(numbers)
    return 0 if numbers.empty?

    numbers = numbers.gsub("\n", ",") # Convert newlines to commas for easier parsing
    numbers.split(',').map(&:to_i).sum
  end
end

# app/views/calculator/index.html.erb