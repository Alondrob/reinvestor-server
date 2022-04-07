class ReportsController < ApplicationController

    def index
        reports = Report.all
        render json: reports
    end

    def show
        report = Report.find(params[:id])     
        data_report = report.calculate_data(report) 
        
        render json: data_report
    end

    def create
        report = current_user.reports.create(report_params)
        
        render json: report
    end

    private



    def report_params
        params.require(:report).permit(:address, :purchase_price, :monthly_rent,
                                        :annual_rent_appreciation, :annual_property_taxes, 
                                        :annual_property_repairs, :annual_vacancy_rate,
                                         :down_pmt, :loan_years, :loan_rate,
                                         :exit_year, :property_appreciation
                                        )
    end


end






   