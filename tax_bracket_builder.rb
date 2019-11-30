require_relative('./tax_bracket')

class TaxBracketBuilder
  class << self
    def initialize_tax_brackets(config)
      config.map do |tax_bracket_config|
        percentage_rate = tax_bracket_config["rate"] * 0.01

        TaxBracket.new(
          rate: percentage_rate,
          start_amount: tax_bracket_config["start_amount"],
          end_amount: tax_bracket_config["end_amount"],
        )
      end
    end
  end
end
