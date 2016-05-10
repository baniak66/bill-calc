class Contract < ActiveRecord::Base
  TAX_RATES = { "0%" => 0.0, "20%" => 0.2, "50%" => 0.5 }
  validates :date, :number, :employer_name, :employee_name, :gross_amount,
            :tax_rate, :bill_number, presence: true
end
