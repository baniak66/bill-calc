class Contract < ActiveRecord::Base
  COST_RATES = { "0%" => 0.0, "20%" => 0.2, "50%" => 0.5 }
  validates :date, :number, :employer_name, :employee_name, :gross_amount,
            :cost_rate, :bill_number, presence: true

end
