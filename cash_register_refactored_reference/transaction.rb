
class Transaction
  attr_accessor :product, :city, :discount_type

  def initialize(product, city, discount)
    @product = product
    @city = city
    @discount = discount || NullObject
  end

  def tax_rate
    if @product.is_taxable
      return (@city.sales_tax_rate / 100.0)
    end
  end

  def discount_rate
    if @discount
      return @product.price * (@discount.rate / 100.0)
    end
  end

  def calculate_total
    return @product.price + calculate_tax_amount.to_f - calculate_discount_amount.to_f
  end

end