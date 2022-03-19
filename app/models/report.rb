class Report < ApplicationRecord
    # belongs_to :user
    def loan_terms(report)
        price = report.purchase_price
        down_payment = 0
        loan = price - down_payment
        rate = report.loan_rate.to_f/100
        years = report.loan_years
        principal_pmt = loan/years
        loan_arr = []

        i=0

        while i<=years
            loan_obj = {}
            loan_remainder = loan - (i*principal_pmt)
            interest = (loan_remainder * rate).round
            
            loan_arr.push({year: i+1, principal: principal_pmt, interest:interest })
            i += 1
        end
        
        puts "this is piski"
        return loan_arr
    end

    def income_terms(report)
        years = report.loan_years
        income = report.monthly_rent*12
        appreciation = 1 + report.annual_rent_appreciation.to_f/100
        income_arr = []
        i=0
        while i <= years
        annual_rent = (income * (appreciation**i)).round
        income_arr.push({year: i+1, income:annual_rent  })
        i +=1
        end
        return income_arr
    end

    def calculate_data (report)
        
        price = report.purchase_price
        down_payment = 0
        years = report.loan_years
        loan = price - down_payment
        rate = report.loan_rate.to_f/100
        annual_income = report.monthly_rent*12
        principal_pmt = loan/years
        report_outcome = []
        i = 0
        
                while i < years
                
                appreciation =  report.annual_rent_appreciation.to_f/100
                annual_rent = (annual_income * (1 +(appreciation**i))).round
                property_taxes = (report.annual_property_taxes.to_f/100)*annual_rent
                property_vacancy_rate = (report.annual_vacancy_rate.to_f/100)*annul_rent
                property_repairs = report.annual_property_taxes.to_f/100
                loan_remainder = loan - (i*principal_pmt)
                interest = (loan_remainder * rate).round
                report_outcome.push({
                                    year: i+1, 
                                    income: annual_rent, 
                                    expenses: {property_taxes:property_taxes, property_vacancy_rate: property_vacancy_rate,  
                                               annual_property_repairs: property_repairs },
                                    loan: {principal: principal_pmt, interest: interest}
                })
                    i+=1
                end
            return report_outcome
        end
end
