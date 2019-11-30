require_relative('./federal_income_tax_calculator')
require_relative('./tax_bracket_builder')
require_relative('./pre_tax_deduction')
require_relative('./contribution')
require 'byebug'
require 'json'

file = File.read("./2019_2020_tax_brackets.json")
tax_bracket_config = JSON.parse(file)

contributions = [
    Contribution.new(
        Contribution::TaxTypes::PRE_TAX,
        Contribution::ValueTypes::PERCENT,
        0.1
    )
]

calculator = FederalIncomeTaxCalculator.new(
    gross_income: 100000,
    itemized_deductions: [PreTaxDeduction.new("medical bill 2019", 13000)],
    contributions: contributions,
    standard_deduction: PreTaxDeduction.new("Standard Deduction 2019", 12200),
    tax_brackets: TaxBracketBuilder.initialize_tax_brackets(tax_bracket_config)
)

puts "expected to pay: #{calculator.total_tax_amount} in taxes."
