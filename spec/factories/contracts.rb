FactoryGirl.define do
  factory :contract do
    date "2016-01-01"
    number "1/2016"
    employer_name "Company name"
    employer_tax_number "0000000000"
    employee_name "Employee name"
    employee_tax_number "9999999999"
    gross_amount 1000.00
    cost_rate 0.0
    bill_number "001"
  end
end
