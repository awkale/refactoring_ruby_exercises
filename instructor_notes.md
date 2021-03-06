# Person class exercise

## I do

After introducing the why of refactoring, read through and talk about how many different jobs `introduce` is doing. Look for nouns and verbs. Solicit participation if the crowd seems keen. 

1) `introduce` first figures out how to print the first name
2) Then it comes up with a way to do the same for address
3) Then it calculates the person's age
4) Finally, it prints it out ever so gorgeously.

Pull out those things into separate methods + a `to_s` method 

new Person methods: 

```ruby

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

  ```



Look! how nice. Point out that there is at least one unexpected guest in Person. Bank! 

Pull out BankAccount into a class and compose into Person like so: 

```ruby 
class BankAccount
  attr_accessor :name, :routing_number, :account_number

  def initialize(name, routing_number, account_number)
    @name = name
    @routing_number = routing_number
    @account_number = account_number
  end

  def to_s
    puts "Bank: #{@name}"
    puts "Routing: #{@routing_number}"
    puts "Acct: #{@account_number}"
  end
end
```

```ruby
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
  #.........
  ```

If the students have a really easy time of that let them extract an address class.

# Cash register

Read through the code and just like a second ago, look for some uninvited nouns and verbs that are doing too much. 


What happens when we expand our cities knowledge? A new discount type? 
