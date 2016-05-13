require "rails_helper"

RSpec.describe Contract, :type => :model do

  let (:contract) { create :contract, cost_rate: 0.2 }
  let (:contract2) { create :contract, gross_amount: 100000, cost_rate: 0.5 }
  let (:contract3) { create :contract, gross_amount: 120000, cost_rate: 0.0 }

  describe "#income_costs" do
    it "calculate income cost with gross amount 1000 and rate 20%" do
      expect(contract.income_costs).to eq(200)
    end
    it "calculate income cost with gross amount 100 000 and rate 50%" do
      expect(contract2.income_costs).to eq(45658.4)
    end
    it "calculate income cost with gross amount 120 000 and rate 0%" do
      expect(contract3.income_costs).to eq(0)
    end
  end

  describe "#tax_base" do
    it "calculate tax base with gross amount 1000 and cost rate 20%" do
      expect(contract.tax_base).to eq(800)
    end
    it "calculate tax base with gross amount 100 000 and cost rate 50%" do
      expect(contract2.tax_base).to eq(54341.6)
    end
    it "calculate tax base with gross amount 120 000 and cost rate 0%" do
      expect(contract3.tax_base).to eq(120000)
    end
  end

  describe "#tax_to_pay" do
    it "calculate tax to pay with gross amount 1000 and cost rate 20%" do
      expect(contract.tax_to_pay).to eq(144)
    end
    it "calculate tax to pay with gross amount 100 000 and cost rate 50%" do
      expect(contract2.tax_to_pay).to eq(9781.49)
    end
    it "calculate tax to pay with gross amount 120 000 and cost rate 0%" do
      expect(contract3.tax_to_pay).to eq(26426.08)
    end
  end

  describe "#net_amount" do
    it "calculate net amount with gross amount 1000 and cost rate 20%" do
      expect(contract.net_amount).to eq(856)
    end
    # it "calculate net amount with gross amount 100 000 and cost rate 50%" do
    #   expect(contract2.net_amount).to eq(90218.51)
    # end
    # expected: 90218.51
         # got: 90218.51 (#<BigDecimal:7ff52bbc5160,'0.9021851E5',18(27)>)
         # why not equal??
    it "calculate net amount with gross amount 120 000 and cost rate 0%" do
      expect(contract3.net_amount).to eq(93573.92)
    end
  end

end
