class Contribution
  module TaxTypes
    PRE_TAX = "pre_tax"
    POST_TAX = "post_tax"
  end

  module ValueTypes
    PERCENT = "percent"
    DOLLAR_AMOUNT = "dollar_amount"
  end

  attr_reader :tax_type, :value_type, :value

  def initialize(tax_type, value_type, value)
    @tax_type = tax_type
    @value_type = value_type
    @value = value
  end

  def pre_tax?
    tax_type == TaxTypes::PRE_TAX
  end

  def post_tax?
    tax_type == TaxTypes::POST_TAX
  end

  def get_amount(income)
    return value if value_type == ValueTypes::DOLLAR_AMOUNT

    (income * value).round(2)
  end
end
