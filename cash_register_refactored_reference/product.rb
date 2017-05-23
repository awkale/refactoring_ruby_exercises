
class Product
  attr_accessor :name, :type, :price

  def initialize(name, type, price)
    @name = name
    @type = type
    @price = price
  end


  def total
    #beware! stinky code below!
    grand_total = @product_price
    
    if @product_type == "taxable"
      taxable = true
    else
      taxable = false
    end

    if @city_of_sale == "New York"
      tax_rate = 9
    elsif @city_of_sale == "Jersey City"
      tax_rate = 3
    elsif @city_of_sale == "Philadelphia"
      tax_rate = 6
    else
      tax_rate = 5
    end

    #taxes come out before discounts. C'est la vie.
    if taxable
      tax_percentage = tax_rate / 100.0
      tax_amount = grand_total * tax_percentage
      grand_total += tax_amount
    end

    grand_total -= discount_amount
    return grand_total
    #simple, right? 
  end

  def discount_amount
    if @discount_type == "loyalty card"
      discount_rate = 5
    elsif @discount_type == "blowout sale"
      discount_rate = 10
    else
      discount_rate = 0
    end
    discount_percentage = discount_rate / 100.0 
    discount_amount = grand_total * discount_percentage

    if customer_brought_bag
      grand_total -= - 0.50
    end
  end
end