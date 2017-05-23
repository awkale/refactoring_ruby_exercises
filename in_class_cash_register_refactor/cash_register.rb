require 'pry'
require 'rspec'

class Receipt
  attr_accessor :product, :product_type, :product_price, :city_of_sale, :discount_type, :customer_brought_bag

  def initialize(product, product_type, product_price, city_of_sale, discount_type, customer_brought_bag)
    @product = product
    @product_type = product_type
    @product_price = product_price
    @city_of_sale = city_of_sale
    @discount_type = discount_type
    @customer_brought_bag = customer_brought_bag
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

RSpec.describe Receipt do
  before(:all) do
    @baby_food_purchase = Receipt.new("baby food", "not taxable", 4, "New York", "loyalty card", true)
    @beer_purchase = Receipt.new("beer", "taxable", 11, "Jersey City", nil, false)
  end

  it('should price things correctly when given a non-taxable item with discounts') do
    expect(@baby_food_purchase.total).to eq(4.30)
  end

  it('should price things correctly when given a taxable item with no discounts') do
    expect(@beer_purchase.total).to eq(11.33)
  end
end