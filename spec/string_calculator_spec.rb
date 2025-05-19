require 'rails_helper'
require 'string_calculator'

RSpec.describe StringCalculator::Calculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator::Calculator.new.add("")).to eq(0)
    end

    it 'returns the sum of numbers' do
      expect(StringCalculator::Calculator.new.add("1,2")).to eq(3)
    end

    it 'returns the sum for many numbers' do
      expect(StringCalculator::Calculator.new.add('1,2,3,4,5')).to eq(15)
      expect(StringCalculator::Calculator.new.add('10,20,30,40')).to eq(100)
      expect(StringCalculator::Calculator.new.add('100,200,300,400,500')).to eq(1500)
    end

    it 'returns 6 for input "1\\n2,3"' do
      expect(StringCalculator::Calculator.new.add("1\n2,3")).to eq(6)
    end


     it 'returns 6 for input "1\\n2,3"' do
      expect(StringCalculator::Calculator.new.add("1\n2,3\n8")).to eq(14)
    end

    # further tescases to handle other delimiters as well 
     it 'supports custom delimiter ;' do
      expect(StringCalculator::Calculator.new.add("//;\n1;2")).to eq(3)
    end

    it 'supports custom delimiter #' do
      expect(StringCalculator::Calculator.new.add("//#\n4#5#6")).to eq(15)
    end

    it 'supports custom delimiter @ with newline' do
      expect(StringCalculator::Calculator.new.add("//@\n7@8\n9")).to eq(24)
    end

    it 'raises an error for negative numbers' do
      expect {
        StringCalculator::Calculator.new.add("1,-2,3,-4")
      }.to raise_error(ArgumentError, "negatives not allowed: -2, -4")
    end

    it 'still works for only positive numbers' do
      expect(StringCalculator::Calculator.new.add("1,2,3")).to eq(6)
    end

    it 'raises error with custom delimiter and negatives' do
      expect {
        StringCalculator::Calculator.new.add("//;\n-1;2;-3")
      }.to raise_error(ArgumentError, "negatives not allowed: -1, -3")
    end
    # exception to show negaitve nos 
    it 'raises an error for negative numbers' do
      expect {
        StringCalculator::Calculator.new.add("1,-2,3,-4")
      }.to raise_error(ArgumentError, "negatives not allowed: -2, -4")
    end

    it 'raises error with custom delimiter and multiple negatives' do
      expect {
        StringCalculator::Calculator.new.add("//;\n-1;2;-3;4;-5")
      }.to raise_error(ArgumentError, "negatives not allowed: -1, -3, -5")
    end 
    it 'tracks the number of times Add() is called' do
      calculator = StringCalculator::Calculator.new
      expect(calculator.get_called_count).to eq(0) # Initially, it should be 0

      calculator.add("1,2")
      expect(calculator.get_called_count).to eq(1) # After calling Add once, count should be 1

      calculator.add("3,4")
      expect(calculator.get_called_count).to eq(2) # After calling Add twice, count should be 2
    end
  end
end

