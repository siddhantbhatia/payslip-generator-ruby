class PayslipGenerator
    def initialize(personName, annualIncome)
        @person_name = personName
        @annual_income = annualIncome

        print generate_monthly_payslip(@annual_income)
    end
    
    def generate_monthly_payslip(annual_income)
        annual_income_tax = self.class.compute_tax(annual_income)
        monthly_income_tax = annual_income_tax / 12

        gross_monthly_income = annual_income / 12
        net_monthly_income = gross_monthly_income - monthly_income_tax

        puts "Monthly Payslip for: \"#{@person_name}\""
        puts "Gross Monthly Income: $#{(gross_monthly_income).round(2)}"
        puts "Monthly Income Tax: $#{(monthly_income_tax).round(2)}"
        puts "Net Monthly Income: $#{(net_monthly_income).round(2)}"
    end

    def self.compute_tax(annual_income)
        total_tax = 0

        while annual_income > 20000
            if annual_income > 180000
                taxable_amount = annual_income - 180000
                tax = taxable_amount * 0.4
            elsif annual_income > 80000
                taxable_amount = annual_income - 80000
                tax = taxable_amount * 0.3
            elsif annual_income > 40000
                taxable_amount = annual_income - 40000
                tax = taxable_amount * 0.2
            else
                taxable_amount = annual_income - 20000
                tax = taxable_amount * 0.1
            end

            total_tax += tax
            annual_income -= taxable_amount
        end 

        return total_tax
        
    end
end

if __FILE__ == $0
    name = ARGV[0]
    annual_income = Integer(ARGV[1])
    generator = PayslipGenerator.new(name, annual_income);
end