require 'pry'

class CashRegister
  
  attr_accessor :discount, :total, :items, :price, :last_transaction
  
  def initialize(discount = 0)
    @items = []
    @total = 0
    @discount = discount
    @price = 0
  end

  def self.total
    @total
  end
  
  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      items << title
    end
    self.last_transaction = price * quantity
  end
  
  
  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      self.total -= (0.01 * @discount * @total).to_i
      "After the discount, the total comes to $#{total}."
      end
    end
  
  def void_last_transaction
    self.total = self.total - self.last_transaction
  end

end