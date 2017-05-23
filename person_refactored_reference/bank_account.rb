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
