class ReportSerializer < ActiveModel::Serializer
  attributes :id, :purchase_price, :monthly_rent, :annual_rent_appreciation, :annual_property_repairs,
             :annual_property_taxes, :annual_vacancy_rate, :loan_rate, :loan_years,
             :exit_year, :property_appreciation
              # :year, :principal, :interest
end
