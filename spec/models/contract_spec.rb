require "rails_helper"

RSpec.describe Contract, :type => :model do

  let (:contract) { create :contract, cost_rate: 0.2 }

  describe "#income_costs" do
    it "calculate income cost with gross amount 1000 and rate 20%" do
      expect(contract.income_costs).to eq(200)
    end
  end

  describe "#tax_base" do
    it "calculate tax base with gross amount 1000 and cost rate 20%" do
      expect(contract.tax_base).to eq(800)
    end
  end

  describe "#tax_to_pay" do
    it "calculate tax to pay with gross amount 1000 and cost rate 20%" do
      expect(contract.tax_to_pay).to eq(144)
    end
  end

  describe "#net_amount" do
    it "calculate net amount with gross amount 1000 and cost rate 20%" do
      expect(contract.net_amount).to eq(856)
    end
  end

end
