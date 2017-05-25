class Address
  attr_accessor :street_address, :apartment_number, :postal_code

  def initialize(street_address, apartment_number, postal_code)
    @street_address = street_address 
    @apartment_number = apartment_number || nil
    @postal_code = postal_code
  end

  def to_s
    if !@apartment_number || @apartment_number.empty?
      return "#{@street_address}, #{@zip_code}"
    else 
      return "#{@street_address} ##{@apartment_number}, #{@zip_code}"
    end
  endz
end
