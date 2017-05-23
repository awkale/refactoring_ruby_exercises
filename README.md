#Refactoring

Refactoring is when you take existing code that gets the job done, and you improve the quality, readability, or idiomaticness of your code without any noticable improvement for the user. According to Martin Fowler, who more or less invented the term it means:

<blockquote>Refactoring (noun): A change made to the internal structure of software to make it easier to understand and cheaper to modify with-out changing its observable behavior.</blockquote>

It's a term that is commonly misused. I often hear other programmers say that they are going to refactor something to fix bugs or improve performance. This is not what we are talking about. 

Refactoring is a favor to your future self reading code from ages ago or a collaborator that you want to give the benefit of readable, modular, easily changed code. After you get used to doing it every now and again, you will become skilled at finding 'code smells' and you will know how to fix them. It's also a great way to get to know a codebase. If you go around and improve the code without breaking anything, you will come away knowing what its doing, and your collaborators will thank you.

This is part of the reality of software development. People don't _always_ follow best practices, including yours truly. There are such things as deadlines, and unfortunately, not everyone has the luxury of writing clean code. People cut corners to save time, and it ends up costing far more in the long run. 

We do this through _composing_ our code in classes. Unlike inheritance, which is best pictures in terms of animal cladistics, composition involves relating things together, like cells that make tissues that make organs that make animals. 

We are going to take a horribly designed class, do a little of refactoring and a little enhancing once it's nice and modular, i.e. easy to test and work with.

# Practical Intro

Watch as I refactor a cluncky class. No need to code along, just watch, chill and ask questions. 

# Together: Cash Register app

## Setup

Make sure that you have a global installation of `pry` for the ruby version you are using. 

You can make sure by running and `$ gem list pry` from your terminal. If you don't get any output from that, just run `$ gem install pry`.

## Start: the receipt class

Holy moley this is some awful code. I sincerely hope you don't ever have to work with something like this. This would be a nightmare to update or test. 

Problems: 

* There is just one method that returns the total, and that method basically has to know every little input and calculation. A long method is a smell, and one of the easiest to clean up. Author Sandi Metz came up with some [rules](https://robots.thoughtbot.com/sandi-metz-rules-for-developers) for developers to follow and one of them is that no Ruby method should ever be more than 5 lines long. That might sound pretty strict but as you learn Ruby's expressive, idomatic syntax and get used to refactoring long methods, you will think of it as less of a tall order.

* There are some nouns here that could be their own class. Think of the class as the noun in your application, and its methods as the verbs. Restful web applications, SQL databases, and object oriented programming all work really well when you organize your code around nouns.

* There are if statements everywhere! There are too many pathways through this one method. For a new person looking at this code for the first time (like you), it's a little hard to understand. 

Solutions: 

* Our goal is to make this Receipt class read better without changing the functionality at all (it will still just be one product per receipt unless we have more time to enhance it). We should only have to alter our tests minimally.

* Make that huge method more sane by `extracting` pieces of the method into smaller, easier to understand ones. This just means we will make smaller methods that work in concert to get the same result.

* Make additional classes with the necessary behavior to make this application more modular and easier to understand.

* Take methods with a lot of branching if statements and parameterize them if possible. I can't seem to find where this quote is from but I remember reading a joke like "An ethical programmer would never write a function called `bomb_baghdad`. They would make a `bomb_city(city)` function that takes in `city` as a parameter so the code is more reusable.

* If we have time, we will also introduce the NullObject pattern for dealing with fallbacks such as default tax rates

## Getting started

Start by reading through with a partner and write down the different steps that you need to deal with to arrive at the right total price. These will become candidates for methods to extract. 

Then look for _nouns_ that are not defined as classes. Write them down on a piece of paper or add comments to the code. These will become candidates for extracting classes.

---------------------------------------------------------------------------------------------------
-- Take 5 and list candidates for extract method and extract class and put them on the whiteboard--
---------------------------------------------------------------------------------------------------

My choices: 

Methods:

```
 determine_tax_rate_for_ny
 determine_tax_rate_for_philly
 determine_tax_rate_for_jc
 break to see whats wrong with that. parameterize methods into determine_tax_rate(city)
 apply_tax_rate
 apply_discounts
 
```

Classes: 

```
  City
  Discount

```

