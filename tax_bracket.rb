class TaxBracket
  attr_reader :rate, :start_amount, :end_amount

  def initialize(
    rate:,
    start_amount:,
    end_amount:
  )
    @rate = rate
    @start_amount = start_amount
    @end_amount = end_amount
  end

  def get_tax_amount(taxable_earnings)
    return 0 if taxable_earnings < start_amount

    taxable_amount = [taxable_earnings, end_amount].min - start_amount
    taxable_amount * rate
  end
end

# Approach
# 1. Understanding the problem
# 2. Model the problem within entities
# 3. Map the relationships


#Gbook
# 1. mapping the classes
  # API class
