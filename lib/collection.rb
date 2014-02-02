require 'rubygems'
require 'highline/import'
require 'sqlite3'
require_relative 'environment'
require_relative 'personalGame'
require_relative 'menu'
require_relative 'report'

class Collection

  def self.deleteGame
    searchQuery = {}
    searchQuery[:query] = ask("\nWhich game would you like to delete? (No apostrophes!)", String)
    database = Environment.database_connection
    database.execute("delete from personalGames where title = '#{searchQuery[:query]}'")
    puts "\n\s\s\s\sSuccessfully deleted #{searchQuery[:query]} from your Personal Games."
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("Delete Another Game") { deleteGame() }
      menu.choice("Go Back To The Edit Menu") { Menu.editCollection() }
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.editGame
    searchQuery = {}
    searchQuery[:title] = ask("\nWhich game would you like to edit? (No apostrophes!)", String)
    puts "\nWhich criteria would you like to edit?"
    choose do |menu|
      menu.choices("Title", "Platform", "Purchase Price") do |chosen|
        searchQuery[:editCategory] = chosen
      end
    end
    if searchQuery[:editCategory] == "Purchase Price"
      searchQuery[:edit] = ask("\nEnter new purchase price.", Integer)
    elsif searchQuery[:editCategory] == "Title"
      searchQuery[:edit] = ask("\nEnter new title. (No apostrophes!)", String)
    else
      puts "\n"
      choose do |menu|
        menu.choices("Console", "Handheld", "Virtual Boy") do |chosen|
          system = chosen
          puts "\n"
          if system == "Console"
            puts "Which one?"
            choose do |menu|
              menu.choices("NES", "SNES", "Nintendo 64", "Gamecube", "Wii", "Wii U") do |chosen|
                searchQuery[:edit] = chosen
              end
            end
          elsif system == "Virtual Boy"
            searchQuery[:edit] = chosen
          else
            puts "Which one?"
            choose do |menu|
              menu.choices("Gameboy", "Gameboy Color", "GBA", "DS", "3DS") do |chosen|
                searchQuery[:edit] = chosen
              end
            end
          end
        end
      end
    end
    database = Environment.database_connection
    database.execute("update personalGames set #{searchQuery[:editCategory]} = '#{searchQuery[:edit]}' where title = '#{searchQuery[:title]}'")
    puts "\n\s\s\s\sSuccessfully changed #{searchQuery[:editCategory]} to #{searchQuery[:edit]}!"
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("Edit Another Game") { editGame() }
      menu.choice("Go Back To The Edit Menu") { Menu.editCollection() }
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
    #UPDATE table_name SET column1=value1,column2=value2, ----- WHERE some_column=some_value;
    Menu.regular()
  end

  def self.allGames
    database = Environment.database_connection
    games = database.execute('select * from personalGames order by title')
    puts "\n"
    games.each do |game|
      puts "\s\s\s\s#{game[1]} (#{game[2]})"
    end
    Menu.showCollectionAgain()
  end

  def self.byPlatform searchQuery
    database = Environment.database_connection
    games = database.execute("select * from personalGames where platform = '#{searchQuery[:query]}' order by title")
    puts "\n"
    games.each do |game|
      puts "\s\s\s\s#{game[1]} (#{game[2]})"
    end
    Menu.showCollectionAgain()
  end
end