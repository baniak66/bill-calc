class Contract < ActiveRecord::Base
  COST_RATES = { "0%" => 0.0, "20%" => 0.2, "50%" => 0.5 }
  validates :date, :number, :employer_name, :employee_name, :gross_amount,
            :cost_rate, :bill_number, presence: true

  @@income_limit = 85528

  def income_costs
    gross_amount * cost_rate
  end

  def tax_base
    gross_amount - income_costs
  end

  def tax_to_pay
    if (sum_tax_base + tax_base) < @@income_limit
      tax_base * 0.18
    else
      ((@@income_limit  - sum_tax_base) * 0.18) + ((tax_base + sum_tax_base - @@income_limit) * 0.32)
    end
  end

  def net_amount
    gross_amount - tax_to_pay
  end

  def sum_tax_base
    Contract.where(employee_name: employee_name, date: date.beginning_of_year..date.end_of_year).
    select{ |d| d.created_at < created_at }.map{ |e| e.tax_base }.sum
  end

end
