class AddTaxNumbersToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :employer_tax_number, :string
    add_column :contracts, :employee_tax_number, :string
  end
end
