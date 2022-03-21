class AddColumnsToReport < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :down_pmt, :integer
    add_column :reports, :address, :string
  end
end
