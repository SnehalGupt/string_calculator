require 'rails_helper'

RSpec.describe StringCalculator, type: :service do
  it "returns 0 for an empty string" do
    expect(StringCalculator.add("")).to eq(0)
  end

  it "returns the sum of numbers" do
    expect(StringCalculator.add("1,2,3")).to eq(6)
  end

  it "handles newlines as delimiters" do
    expect(StringCalculator.add("1\n2,3")).to eq(6)
  end
end
