require 'rubygems'
require 'highline/import'
require_relative 'personalGame'
require_relative 'collection'
require_relative 'report'

class Menu
  def self.top
    puts "\n\s\s-------------------------------------------------"
    puts "-----------Welcome to Nintendo Negotiator!-----------"
    puts "----Your personal Nintendo game price determiner.----"
    puts "\s\s-------------------------------------------------"
    puts "\nWhat would you like to do?"
    choose do |menu|
      menu.choice("Add a Game") { PersonalGame.new() }
      menu.choice("See Your Collection") { Collection.showCollection() }
      menu.choice("Edit Your Collection") { Collection.editCollection() }
      menu.choice("Exit") { exit }
    end
  end

  def self.regular
    puts "\nDone!\n\nNow, what would you like to do?"
    choose do |menu|
      menu.choice("Add a Game") { PersonalGame.new() }
      menu.choice("See Your Collection") { Collection.showCollection() }
      menu.choice("Edit Your Collection") { Collection.editCollection() }
      menu.choice("Exit") { exit }
    end
  end

  def self.specialReport
    puts "\nWhich report would you like?"
    choose do |menu|
      menu.choice("Worth By Console") { Report.worthByConsole() }
      menu.choice("Worth By Series") { Report.worthBySeries() }
      menu.choice("Worth By Developer") { Report.worthBySeries() }
      menu.choice("Worth By Release Year") { Report.worthByReleaseYear() }
      menu.choice("Back to Main Menu") { top() }
      menu.choice("Exit") { exit }
    end
  end
end