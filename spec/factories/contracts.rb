FactoryGirl.define do
  factory :contract do
    date "2016-01-01"
    number "1/2016"
    employer_name "Company name"
    employee_name "Employee name"
    gross_amount 1000.00
    cost_rate 0.0
    bill_number "001"
  end
end
