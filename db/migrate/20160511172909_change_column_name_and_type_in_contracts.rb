class ChangeColumnNameAndTypeInContracts < ActiveRecord::Migration
  def up
   rename_column :contracts, :tax_rate, :cost_rate
   change_column :contracts, :date, :date
  end

  def down
   rename_column :contracts, :cost_rate, :tax_rate
   change_column :contracts, :date, :datetime
  end
end
