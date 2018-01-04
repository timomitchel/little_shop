class Cart

  attr_reader :contents

  def initialize(contents)
    @contents = contents || Hash.new(0)
  end

  def total_count
    contents.values.sum
  end

  def add_item(id)
    contents[id.to_s] = contents[id.to_s] + 1
  end

  def subtract_item(id)
    contents[id.to_s] -= 1
  end

  def count_of(id)
    contents[id.to_s].to_i
  end

  def total_price
    items = Item.where(id: contents.keys)
    items.reduce(0) do |sum, item|
      sum + item.price
    end
  end
end
