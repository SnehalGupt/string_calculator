require 'rails_helper'
require 'string_calculator'
# RSpec.describe StringCalculator do
#   describe '.add' do
#     it 'returns 0 for empty string' do
#       expect(StringCalculator.add("")).to eq(0)
#     end

#     # it 'returns sum for comma-separated numbers' do
#     #   expect(StringCalculator.add("1,2,3")).to eq(6)
#     # end

#     # it 'handles newline as delimiter' do
#     #   expect(StringCalculator.add("1\n2,3")).to eq(6)
#     # end

#     # it 'supports custom delimiter' do
#     #   expect(StringCalculator.add("//;\n1;2")).to eq(3)
#     # end

#     # it 'raises error for negative numbers' do
#     #   expect {
#     #     StringCalculator.add("1,-2,3")
#     #   }.to raise_error("negative numbers not allowed: -2")
#     # end

#     # it 'raises error for multiple negatives' do
#     #   expect {
#     #     StringCalculator.add("//;\n-4;2;-7")
#     #   }.to raise_error("negative numbers not allowed: -4, -7")
#     # end

#   end
# end
RSpec.describe StringCalculator::Calculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator::Calculator.new.add("")).to eq(0)
    end

    it 'returns the sum of numbers' do
      expect(StringCalculator::Calculator.new.add("1,2")).to eq(3)
    end

    it 'returns the sum for many numbers' do
      expect(StringCalculator.new.add('1,2,3,4,5')).to eq(15)
      expect(StringCalculator.new.add('10,20,30,40')).to eq(100)
      expect(StringCalculator.new.add('100,200,300,400,500')).to eq(1500)
    end
    
  end
end

