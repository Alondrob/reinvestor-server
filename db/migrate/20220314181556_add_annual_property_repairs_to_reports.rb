class AddAnnualPropertyRepairsToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :annual_property_repairs, :integer
  end
end
