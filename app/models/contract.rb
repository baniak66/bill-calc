class Contract < ActiveRecord::Base
  COST_RATES = { "0%" => 0.0, "20%" => 0.2, "50%" => 0.5 }
  validates :date, :number, :employer_name, :employee_name, :gross_amount,
            :cost_rate, :bill_number, presence: true

  def income_costs
    gross_amount * cost_rate
  end

  def tax_base
    gross_amount - income_costs
  end

  def tax_to_pay
    tax_base * 0.18
  end

  def net_amount
    gross_amount - tax_to_pay
  end
end
