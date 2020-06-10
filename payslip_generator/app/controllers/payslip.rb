class Payslip
    def initialize(personName, annualIncome)
        @person_name = personName
        @annual_income = annualIncome
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