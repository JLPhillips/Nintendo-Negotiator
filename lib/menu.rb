require 'rubygems'
require 'highline/import'
require 'sqlite3'
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
      menu.choice("Add a Game") { personalGame() }
      menu.choice("See Your Collection") { showCollection() }
      menu.choice("Edit Your Collection") { editCollection() }
      menu.choice("What is Nintendo Negotiator?") { Ascii.about() }
      menu.choice("Exit") { superExit() }
    end
  end

  def self.done
    puts "\nNow, what would you like to do?"
    choose do |menu|
      menu.choice("Add a Game") { personalGame() }
      menu.choice("See Your Collection") { showCollection() }
      menu.choice("Edit Your Collection") { editCollection() }
      menu.choice("What is Nintendo Negotiator?") { Ascii.about() }
      menu.choice("Exit") { superExit() }
    end
  end

  def self.regular
    Ascii.logo()
    puts "---------------------------------------------------"
    puts "---------------------------------------------------"
    puts "\nWhat would you like to do?"
    choose do |menu|
      menu.choice("Add a Game") { personalGame() }
      menu.choice("See Your Collection") { showCollection() }
      menu.choice("Edit Your Collection") { editCollection() }
      menu.choice("What is Nintendo Negotiator?") { Ascii.about() }
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
      menu.choice("Virtual Boy"){ searchVirtualBoy() }
    end
  end

  def self.searchConsoleGames
    puts "\nWhich one?"
    choose do |menu|
      menu.choices("NES", "SNES", "Nintendo 64", "Gamecube", "Wii", "Wii U") do |chosen|
        searchQuery = {}
        searchQuery[:query] = chosen
        Collection.byPlatform(searchQuery)
      end
    end
  end

  def self.searchHandheldGames
    puts "\nWhich one?"
    choose do |menu|
      menu.choices("Gameboy", "GBA", "DS", "3DS") do |chosen|
        searchQuery = {}
        searchQuery[:query] = chosen
        Collection.byPlatform(searchQuery)
      end
    end
  end

  def self.searchVirtualBoy
    searchQuery = {:query=>"Virtual Boy"}
    Collection.byPlatform(searchQuery)
  end

  def self.editCollection
    Ascii.editCollection()
    puts "\nHow would you like to edit your collection?"
    choose do |menu|
      menu.choice("Edit a Game") { Collection.editGame() }
      menu.choice("Delete a Game") { Collection.deleteGame() }
      menu.choice("Back to Main Menu") { regular() }
      menu.choice("Exit") { superExit() }
    end
  end

# -----------------------------------------------[REPORTS]----------------->

  def self.specialReport
    puts "\nWhich report would you like?"
    choose do |menu|
      menu.choice("Worth of All Titles") { Report.allTitles() } #done
      menu.choice("Worth By Specific Title") { worthBySpecificTitle() } #done
      menu.choice("Worth By Platform") { worthByPlatformMenu() } #done
      # menu.choice("Worth By Series") { Report.worthBySeries() }
      menu.choice("Worth By Developer") { Report.worthByDeveloper() } #done
      menu.choice("Worth By Publisher") { Report.worthByPublisher() } #done
      menu.choice("Worth By Release Year") { Report.worthByReleaseYear() } #done
      menu.choice("Total Money Gained/Lost") { Report.totalMoney() }
      menu.choice("Worth By Italian Plumbers") { Ascii.mario2() } #done
      menu.choice("Back to Collection Menu") { showCollectionAgain() } #done
      menu.choice("Back to Main Menu") { top() } #done
      menu.choice("Exit") { superExit() }
    end
  end

  def self.worthBySpecificTitle
    searchQuery = {}
    searchQuery[:title] = ask("\nTitle? (Don't use any apostrophes!)", String)
    choose do |menu|
      menu.choices("Console", "Handheld", "Virtual Boy") do |chosen|
        system = chosen
        puts "\n"
        if system == "Console"
          puts "Which one?"
          choose do |menu|
            menu.choices("NES", "SNES", "Nintendo 64", "Gamecube", "Wii", "Wii U") do |chosen|
              searchQuery[:platform] = chosen
            end
          end
        elsif system == "Virtual Boy"
          searchQuery[:platform] = chosen
        else
          puts "Which one?"
          choose do |menu|
            menu.choices("Gameboy", "Gameboy Color", "GBA", "DS", "3DS") do |chosen|
              searchQuery[:platform] = chosen
            end
          end
        end
      end
    end
    Report.worthBySpecificTitle(searchQuery)
  end

  def self.specialReportMenu
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("Go Back To Special Reports") { specialReport() }
      menu.choice("Go Back To See Your Collection") { showCollection() }
      menu.choice("Go Back To Main Menu") { regular() }
      menu.choice("Exit") { superExit() }
    end
  end

  def self.worthByPlatformMenu
    puts "\nConsole, Handheld, or Virtual Boy?"
    choose do |menu|
      menu.choice("Console"){ worthByPlatformConsole() }
      menu.choice("Handheld"){ worthByPlatformHandheld() }
      menu.choice("Virtual Boy"){ worthByPlatformVirtualBoy() }
    end
  end

  def self.worthByPlatformConsole
    puts "\nWhich one?"
    choose do |menu|
      menu.choices("NES", "SNES", "Nintendo 64", "Gamecube", "Wii", "Wii U") do |chosen|
        searchQuery = {}
        searchQuery[:query] = chosen
        Report.worthByPlatform(searchQuery)
      end
    end
  end

  def self.worthByPlatformHandheld
    puts "\nWhich one?"
    choose do |menu|
      menu.choices("Gameboy", "GBA", "DS", "3DS") do |chosen|
        searchQuery = {}
        searchQuery[:query] = chosen
        Report.worthByPlatform(searchQuery)
      end
    end
  end

  def self.worthByPlatformVirtualBoy
    searchQuery = {:query=>"Virtual Boy"}
    Report.worthByPlatform(searchQuery)
  end

# -----------------------------------------------[Platform Select]----------------->

  # def self.platformSelect
  #   puts "\nConsole, Handheld, or Virtual Boy?"
  #   choose do |menu|
  #     menu.choice("Console"){ platformSelectConsole() }
  #     menu.choice("Handheld"){ platformSelectHandheld() }
  #     menu.choice("Virtual Boy"){ platformSelectVirtualBoy() }
  #   end
  # end

  # def self.platformSelectConsole
  #   puts "\nWhich one?"
  #   choose do |menu|
  #     menu.choices("NES", "SNES", "Nintendo 64", "Gamecube", "Wii", "Wii U") do |chosen|
  #       searchQuery = {}
  #       searchQuery[:platform] = chosen
  #       return searchQuery
  #     end
  #   end
  # end

  # def self.platformSelectHandheld
  #   puts "\nWhich one?"
  #   choose do |menu|
  #     menu.choices("Gameboy", "GBA", "DS", "3DS") do |chosen|
  #       searchQuery = {}
  #       searchQuery[:platform] = chosen
  #       return searchQuery
  #     end
  #   end
  # end

  # def self.platformSelectVirtualBoy
  #   searchQuery = {:platform=>"Virtual Boy"}
  #   return searchQuery
  # end

# -----------------------------------------------[SUPER EXIT]----------------->

  def self.superExit
    Ascii.bye()
    exit
  end
end