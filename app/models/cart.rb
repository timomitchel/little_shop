class Cart

  attr_reader :contents

  def initialize(contents)
    @contents = contents || Hash.new(0)
  end

  def total_count
    contents.values.sum
  end

  def item_count
    
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def subtract_item(id)
    contents[id.to_s] -= 1
    contents.delete(id) if contents[id] == 0
  end

  def count_of(id)
    contents[id.to_s].to_i
  end

  def subtotal(price, quantity)
    price * quantity
  end

  def total_price
    result = 0.0
    contents.each do |id, quantity|
       result += Item.find(id).price * quantity
     end
     result
  end
end
