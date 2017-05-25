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
    puts "------------"
    puts @street_address
    puts "Age:"
    puts age
    puts "------------"
    puts "Account Info"
    puts @bank
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
      return "#{@street_address}, #{@zip_code}"
    else 
      return "#{@street_address} ##{@apartment_number}, #{@zip_code}"
    end
  end

  def age
    age = (Date.today - @birthday).to_i / 365
  end
end
