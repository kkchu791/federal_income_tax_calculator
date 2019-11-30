class PreTaxDeduction
  attr_reader :description, :amount

  def initialize(description, amount)
    @description = description
    @amount = amount
  end
end
