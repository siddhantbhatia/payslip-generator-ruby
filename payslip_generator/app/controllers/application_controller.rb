require_relative "./payslip"

class ApplicationController < ActionController::API
    def index
        annual_income = Integer(params[:annual_salary])

        annual_income_tax = Payslip.compute_tax(annual_income)
        monthly_income_tax = (annual_income_tax / 12).round(2)

        gross_monthly_income = (annual_income / 12).round(2)
        net_monthly_income = gross_monthly_income - monthly_income_tax

        requestBody = {
            "employee_name": params[:employee_name],
            "gross_monthly_income": gross_monthly_income,
            "monthly_income_tax": monthly_income_tax,
            "net_monthly_income": net_monthly_income
        }

        render json: {data:requestBody},status: :ok



        # payslip = Payslip(params[:employee_name], params[:annual_salary])

        # annual_income_tax = payslip.compute_tax(annual_income)
        # monthly_income_tax = annual_income_tax / 12

        # gross_monthly_income = annual_income / 12
        # net_monthly_income = gross_monthly_income - monthly_income_tax

    end
end
