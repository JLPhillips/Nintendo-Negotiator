require 'rubygems'
require 'highline/import'
require_relative 'personalGame'
require_relative 'collection'
require_relative 'report'
require_relative 'ascii'

# -----------------------------------------------[MAIN MENU]----------------->

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
      menu.choice("What is Nintendo Negotiator?") { Ascii.about() }
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

# -----------------------------------------------[ADD A GAME]----------------->

  def self.personalGame
    personalGame = {}
    Ascii.addGame()
    puts "\nConsole, Handheld, or Virtual Boy?"
    choose do |menu|
      menu.choices("Console", "Handheld", "Virtual Boy") do |chosen|
        system = chosen
        puts "\n"
        if system == "Console"
          puts "Which one?"
          choose do |menu|
            menu.choices("NES", "SNES", "Nintendo 64", "Gamecube", "Wii", "Wii U") do |chosen|
              personalGame[:platform] = chosen
            end
          end
        elsif system == "Virtual Boy"
          personalGame[:platform] = chosen
        else
          puts "Which one?"
          choose do |menu|
            menu.choices("Gameboy", "Gameboy Color", "GBA", "DS", "3DS") do |chosen|
              personalGame[:platform] = chosen
            end
          end
        end
      end
    end

    personalGame[:title] = ask("\nTitle? (Don't use any apostrophes!)", String)


    # puts "\nCurrent condition?"
    # choose do |menu|
    #   menu.choices("New", "Like New", "Very Good", "Good", "Acceptable", "Poor") do |chosen|
    #     personalGame[:condition] = chosen
    #   end
    # end

    personalGame[:purchasePrice] = ask("\nPrice you paid for it?", Integer)
    puts "\n"

    choose do |menu|
      menu.choice("Save Game") { PersonalGame.save(personalGame) }
      menu.choice("Start Over") { personalGame() }
      menu.choice("Go to Main Menu") { regular() }
      menu.choice("Exit") { superExit() }
    end
  end

# -----------------------------------------------[COLLECTION]----------------->

  def self.showCollection
    Ascii.seeCollection()
    puts "\nHow would you like to see your collection?"
    choose do |menu|
      menu.choice("All Games") { Collection.allGames() }
      menu.choice("Game by Platform") { platformGames() }
      menu.choice("Special Report") { specialReport() }
      menu.choice("Back to Main Menu") { regular() }
      menu.choice("Exit") { superExit() }
    end
  end

  def self.showCollectionAgain
    puts "\nHow would you like to see your collection?"
    choose do |menu|
      menu.choice("All Games") { Collection.allGames() }
      menu.choice("Game by Platform") { platformGames() }
      menu.choice("Special Report") { specialReport() }
      menu.choice("Back to Main Menu") { regular() }
      menu.choice("Exit") { superExit() }
    end
  end

  def self.platformGames
    puts "\nConsole, Handheld, or Virtual Boy?"
    choose do |menu|
      menu.choice("Console"){ searchConsoleGames() }
      menu.choice("Handheld"){ searchHandheldGames() }
      menu.choice("Virtual Boy"){ Collection.byPlatform("Virtual Boy") }
    end
  end

  def self.searchConsoleGames
    puts "Which one?"
    choose do |menu|
      menu.choices("NES", "SNES", "Nintendo 64", "Gamecube", "Wii", "Wii U") do |chosen|
        Collection.byPlatform(chosen)
      end
    end
  end

  def self.searchHandheldGames
    puts "Which one?"
    choose do |menu|
      menu.choices("Gameboy", "GBA", "DS", "3DS") do |chosen|
        Collection.byPlatform(chosen)
      end
    end
  end

  def self.editCollection
    Ascii.editCollection()
    puts "\nHow would you like to edit your collection?"
    choose do |menu|
      menu.choice("Edit a Game") { Collection.deleteGame() }
      menu.choice("Delete a Game") { Collection.editGame() }
      menu.choice("Back to Main Menu") { regular() }
      menu.choice("Exit") { superExit() }
    end
  end

# -----------------------------------------------[REPORTS]----------------->

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

# -----------------------------------------------[SUPER EXIT]----------------->

  def self.superExit
    Ascii.bye()
    exit
  end
end