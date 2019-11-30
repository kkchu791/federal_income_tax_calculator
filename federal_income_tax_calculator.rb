class FederalIncomeTaxCalculator
  attr_reader(
    :gross_income,
    :itemized_deductions,
    :contributions,
    :standard_deduction,
    :tax_brackets
  )

  def initialize(
    gross_income:,
    itemized_deductions:,
    contributions:,
    standard_deduction:,
    tax_brackets:
  )
    @gross_income = gross_income
    @itemized_deductions = itemized_deductions
    @contributions = contributions
    @standard_deduction = standard_deduction
    @tax_brackets = tax_brackets
  end

  def total_tax_amount
    tax_brackets.sum do |tax_bracket|
      tax_bracket.get_tax_amount(taxable_earnings)
    end
  end

  def taxable_earnings
    gross_income - pre_tax_contribution_amount - pre_tax_deduction_amount
  end

  private

  def pre_tax_contribution_amount
    contributions.select(&:pre_tax?).sum do |contribution|
      contribution.get_amount(gross_income)
    end
  end

  def pre_tax_deduction_amount
    standard_deduction.amount > total_itemized_deduction_amount ?
      standard_deduction.amount :
      total_itemized_deduction_amount
  end

  def total_itemized_deduction_amount
    itemized_deductions.sum(&:amount)
  end
end
