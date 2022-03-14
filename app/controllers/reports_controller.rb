class ReportsController < ApplicationController

    def index
        reports = Report.all
        render json: reports
    end

    def show
        report = Report.find(params[:id])
        render json: report
    end

    def create
        
        report = Report.create(report_params)
   
        render json: report
    end

    private
    def report_params
        params.require(:report).permit(:purchase_price, :monthly_rent,
                                        :annual_rent_appreciation, :annual_property_taxes, 
                                        :annual_property_repairs, :annual_vacancy_rate,
                                         :loan_years, :loan_rate,
                                         :exit_year, :property_appreciation
                                        )
    end


end






   Report.create(:purchase_price => 500000, :monthly_rent => 10000, :annual_rent_appreciation => 1,:annual_property_taxes => 2, :annual_vacancy_rate => 5, :annual_property_repairs => 5,:loan_years => 20, :exit_year => 5, :annual_property_repairs => 2)