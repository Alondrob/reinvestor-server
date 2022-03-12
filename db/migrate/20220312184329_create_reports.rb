class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :purchase_price
      t.integer :monthly_rent
      t.integer :annual_rent_appreciation
      t.integer :annual_property_taxes
      t.integer :annual_vacancy_rate
      t.integer :loan_years
      t.integer :loan_rate
      t.integer :exit_year
      t.integer :property_appreciation
      t.timestamps
    end
  end
end
