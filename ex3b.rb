class InvoicingProgram
  def initialize(prices)
    @prices = prices
  end

  def print_prices
    puts "Prices for testing: #{@prices}"
  end

  def calculate_total
    total = @prices.inject(0, :+)
    puts "Total of the prices: #{total}"
    total
  end

  def calculate_discount
    discount = @prices.inject(0) { |sum, price| sum + price * (1.0 / 3) }
    puts "Discount (1/3 off each price): #{discount}"
    discount
  end
end

test_prices = [100, 250, 350, 410]

invoicing_program = InvoicingProgram.new(test_prices)

invoicing_program.print_prices

total = invoicing_program.calculate_total

discount = invoicing_program.calculate_discount
