class RemoveAnnualPropertyRepairsFromReports < ActiveRecord::Migration[6.1]
  def change
    remove_column :reports, :annual_property_repairs
  end
end
