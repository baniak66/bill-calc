class Contract < ActiveRecord::Base
  validates :date, :number, :employer_name, :employee_name, :gross_amount,
            :tax_rate, :bill_number, presence: true
end
