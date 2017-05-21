require 'pry'
require 'rspec'

class Person
  attr_accessor :first_name, :middle_name, :last_name, :bank_name, :bank_routing_number, :bank_account_number, :street_address, :apartment_number, :zip_code

  def initialize(first_name, middle_name, last_name, bank_name, bank_routing_number, bank_account_number, street_address, apartment_number, zip_code)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    @bank_name = bank_name
    @bank_routing_number = bank_routing_number
    @bank_account_number = bank_account_number
    @street_address = street_address
    @apartment_number = apartment_number
    @zip_code = zip_code
  end

  def introduce
    if @middle_name.blank?
      full_name = "#{@first_name} #{@last_name}"
    else
      full_name = "#{@first_name} #{@middle_name} #{@last_name}"
    end

    if @apartment_number.blank?
      address = "#{@street_address} #{@apartment_number}"
    puts full_name
    puts ""

  end



end

alice = Person.new("Alice", "Abigail", "Anderson", "TD", 12345, 253367435, "118 Eagle St", "", 11222)
alice = Person.new("Bob", "", "Barnes", "Chase", 12677, 09976876, "990 Manhattan Av", "16", 11222)
binding.pry

# RSpec.describe Person do

# end
