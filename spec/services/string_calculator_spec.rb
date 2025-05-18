require 'rails_helper'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for empty string' do
      expect(described_class.add("")).to eq(0)
    end

    it 'returns sum for comma-separated numbers' do
      expect(described_class.add("1,2,3")).to eq(6)
    end

    it 'handles newline as delimiter' do
      expect(described_class.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiter' do
      expect(described_class.add("//;\n1;2")).to eq(3)
    end

    it 'raises error for negative numbers' do
      expect {
        described_class.add("1,-2,3")
      }.to raise_error("negative numbers not allowed: -2")
    end

    it 'raises error for multiple negatives' do
      expect {
        described_class.add("//;\n-4;2;-7")
      }.to raise_error("negative numbers not allowed: -4, -7")
    end
  end
end

