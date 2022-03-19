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

        i=1

        while i<=years
            loan_obj = {}
            loan_remainder = loan - (i*principal_pmt)
            interest = (loan_remainder * rate).round
            
            loan_arr.push({year: i, principal: principal_pmt, interest:interest })
            i += 1
        end
        
        puts "this is piski"
        return loan_arr
    end
end
