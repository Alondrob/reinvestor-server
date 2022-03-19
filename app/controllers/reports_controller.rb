class ReportsController < ApplicationController

    def index
        reports = Report.all
        render json: reports
    end

    def show
        report = Report.find(params[:id]) 
        loan_report = report.loan_terms(report)
        render json: loan_report
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






   