require 'pry'
require 'rspec'
require 'date'

require_relative "person"
require_relative "bank_account"

chase = BankAccount.new("Chase", 12431523, 34534573)
td = BankAccount.new("TD", 675609785, 12415)

alice = Person.new("Alice", "Abigail", "Anderson", "1984-07-13", chase, "118 Eagle St", "", 11222)
bob = Person.new("Bob", "", "Barnes", "1992-07-13",  td, "990 Manhattan Av", "16", 11222)

binding.pry
