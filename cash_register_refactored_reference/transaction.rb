
class Transaction
  attr_accessor :product, :city, :discount_type

  def initialize(product, city, discount)
    @product = product
    @city = city
    @discount = discount
  end

  def calculate_tax_amount
    if @product.type == "taxable"
      return @city.tax_rate * @product.price
    end
  end

  def calculate_discount_amount
    if @discount
      return @product.price * @discount.rate
    end
  end

  def calculate_total
    return @product.price + calculate_tax_amount.to_f - calculate_discount_amount.to_f
  end

end