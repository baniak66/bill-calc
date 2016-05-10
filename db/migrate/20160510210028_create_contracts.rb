class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.datetime :date
      t.string :number
      t.string :employer_name
      t.string :employee_name
      t.decimal :gross_amount, precision: 10, scale: 2
      t.decimal :tax_rate, precision: 5, scale: 2
      t.string :bill_number

      t.timestamps null: false
    end
  end
end
