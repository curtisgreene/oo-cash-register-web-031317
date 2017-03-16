require 'pry'

class CashRegister
  attr_accessor :total, :discount, :cart, :last_transaction

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(item, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      cart << item
    end
    self.last_transaction = price * quantity
    # binding.pry
  end

  def apply_discount
    if @discount
      @total = @total - @total * @discount / 100.00
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
