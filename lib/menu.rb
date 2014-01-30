require 'rubygems'
require 'highline/import'
require_relative 'personalGame'
require_relative 'collection'
require_relative 'report'
require_relative 'ascii'

class Menu
  def self.top
    Ascii.logo()
    puts "\s\s------------------------------------------------"
    puts "-----------Welcome to Nintendo Negotiator-----------"
    puts "----Your personal Nintendo game price determiner----"
    puts "\s\s------------------------------------------------"
    puts "\nWhat would you like to do?"
    choose do |menu|
      menu.choice("Add a Game") { PersonalGame.new() }
      menu.choice("See Your Collection") { Collection.showCollection() }
      menu.choice("Edit Your Collection") { Collection.editCollection() }
      menu.choice("What is Nintendo Negotiator?") { Ascii.aboutPsp() }
      menu.choice("Exit") { superExit() }
    end
  end

  def self.done
    puts "\n\nNow, what would you like to do?"
    choose do |menu|
      menu.choice("Add a Game") { PersonalGame.new() }
      menu.choice("See Your Collection") { Collection.showCollection() }
      menu.choice("Edit Your Collection") { Collection.editCollection() }
      menu.choice("Exit") { superExit() }
    end
  end

  def self.regular
    Ascii.logo()
    puts "---------------------------------------------------"
    puts "---------------------------------------------------"
    puts "\nWhat would you like to do?"
    choose do |menu|
      menu.choice("Add a Game") { PersonalGame.new() }
      menu.choice("See Your Collection") { Collection.showCollection() }
      menu.choice("Edit Your Collection") { Collection.editCollection() }
      menu.choice("Exit") { superExit() }
    end
  end

  def self.specialReport
    puts "\nWhich report would you like?"
    choose do |menu|
      menu.choice("Worth By Console") { Report.worthByConsole() }
      menu.choice("Worth By Series") { Report.worthBySeries() }
      menu.choice("Worth By Developer") { Report.worthBySeries() }
      menu.choice("Worth By Release Year") { Report.worthByReleaseYear() }
      menu.choice("Worth By Italian Plumbers") { Ascii.mario() }
      menu.choice("Back to Collection Menu") { showCollectionAgain() }
      menu.choice("Back to Main Menu") { top() }
      menu.choice("Exit") { superExit() }
    end
  end

  def self.showCollectionAgain
    puts "\nHow would you like to see your collection?"
    choose do |menu|
      menu.choice("All Games") { allGames() }
      menu.choice("Special Report") { Menu.specialReport() }
      menu.choice("Back to Main Menu") { Menu.regular() }
      menu.choice("Exit") { superExit() }
    end
  end

  def self.superExit
    Ascii.bye()
    exit
  end
end