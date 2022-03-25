class Report < ApplicationRecord
    belongs_to :user
    
    def calculate_data (report)
        
        price = report.purchase_price
        down_payment = report.down_pmt.to_f/100
        years = report.loan_years
        loan = price - (down_payment * price)
        principal_pmt = (loan/years).round
        rate = report.loan_rate.to_f/100
        annual_income = report.monthly_rent*12
       
        report_outcome = []
        i = 0
        
                while i <= years
                
                appreciation =  report.annual_rent_appreciation.to_f/100
                annual_rent = (annual_income * (1 + appreciation)**i).round
                property_taxes = ((report.annual_property_taxes.to_f/100)*annual_rent).round
                property_vacancy_rate = ((report.annual_vacancy_rate.to_f/100)*annual_rent).round
                # binding.pry
                property_repairs = ((report.annual_property_taxes.to_f/100)*annual_rent).round
                loan_remainder = loan - (i*principal_pmt)
                
                equity = (price * (1 + report.property_appreciation.to_f/100) **i) - loan_remainder
                interest = (loan_remainder * rate).round
                report_outcome.push({
                                    address: report.address,
                                    price: price,
                                    down_payment: down_payment,
                                    year: i+1, 
                                    income: annual_rent, 
                                    expenses: {property_taxes:property_taxes, property_vacancy_rate: property_vacancy_rate,  
                                               annual_property_repairs: property_repairs },
                                    loan: {principal: principal_pmt, interest: interest},
                                    equity: equity
                                    })
                    i+=1
                end

            return report_outcome

        end
end
