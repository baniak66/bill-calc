class Contract < ActiveRecord::Base
  COST_RATES = { "0%" => 0.0, "20%" => 0.2, "50%" => 0.5 }
  validates :date, :number, :employer_name, :employee_name, :gross_amount,
            :cost_rate, :bill_number, :employer_tax_number, :employee_tax_number, presence: true
  validates_format_of :employer_tax_number, :employee_tax_number, :with => /\A\d{10}\z/

  @@income_limit = 85528
  @@cost_limit = 42764

  def income_costs
    if sum_cost_50_percent > @@cost_limit
      gross_amount * 0.2
    elsif (gross_amount * cost_rate) + sum_cost_50_percent > @@cost_limit
      (@@cost_limit - sum_cost_50_percent) + ((gross_amount - ((@@cost_limit - sum_cost_50_percent) / 0.5)) * 0.2)
    else
      gross_amount * cost_rate
    end
  end

  def tax_base
    gross_amount - income_costs
  end

  def tax_to_pay
    if (sum_tax_base + tax_base) < @@income_limit
      (tax_base * 0.18).round(2)
    else
      (((@@income_limit  - sum_tax_base) * 0.18) + ((tax_base + sum_tax_base - @@income_limit) * 0.32)).round(2)
    end
  end

  def net_amount
    gross_amount - tax_to_pay
  end

  def sum_tax_base
    Contract.where(employee_tax_number: employee_tax_number, date: date.beginning_of_year..date.end_of_year).
    select{ |d| d.created_at < created_at }.map{ |e| e.tax_base }.sum.round(2)
  end

  def sum_cost_50_percent
    Contract.where(employee_tax_number: employee_tax_number, cost_rate: 0.5, date: date.beginning_of_year..date.end_of_year).
    select{ |d| d.created_at < created_at }.map{ |e| e.income_costs }.sum.round(2)
  end
end
