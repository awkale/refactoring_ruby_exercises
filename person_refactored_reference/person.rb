class Person
  attr_accessor :first_name, :middle_name, :last_name, :birthday, :bank, :street_address, :apartment_number, :zip_code

  def initialize(first_name, middle_name, last_name, birthday, bank, street_address, apartment_number, zip_code)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    @birthday = Date.parse(birthday)
    @bank = bank
    @street_address = street_address
    @apartment_number = apartment_number
    @zip_code = zip_code
  end

  def print_intro
    puts "Name:" 
    puts full_name
    puts "------------"
    puts "Address:"
    puts address
    puts "------------"
    puts "Age:"
    puts age
    puts "------------"
    puts "Account Info"
    puts @bank.name
    puts "Routing # #{@bank.routing_number}"
    puts "Acct # #{@bank.account_number}"
  end

  def full_name
    if !@middle_name || @middle_name.empty?
      return "#{@first_name} #{@last_name}"
    else
      return "#{@first_name} #{@middle_name} #{@last_name}"
    end
  end

  def address
    if !@apartment_number || @apartment_number.empty?
      address = "#{@street_address}, #{@zip_code}"
    else 
      address = "#{@street_address} ##{@apartment_number}, #{@zip_code}"
    end
  end

  def age
    age = (Date.today - @birthday).to_i / 365
  end
end
