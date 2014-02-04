require 'rubygems'
require 'highline/import'
require 'sqlite3'
require_relative 'personalGame'
require_relative 'collection'
require_relative 'report'
require_relative 'ascii'
require_relative 'menu'

class EasterEgg
  def self.secretMain
    Ascii.logo()
    puts "---------------------------------------------------"
    puts "---------------------------------------------------"
    puts "\nWhat would you like to do?"
    choose do |menu|
      menu.choice("Add a Game") { Menu.personalGame() }
      menu.choice("See Your Collection") { secretShowCollection() }
      menu.choice("Edit Your Collection") { Menu.editCollection() }
      menu.choice("What is Nintendo Negotiator?") { Ascii.about() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.secretShowCollection
    Ascii.seeCollection()
    puts "\nHow would you like to see your collection?"
    choose do |menu|
      menu.choice("All Games") { Collection.allGames() }
      menu.choice("Game by Platform") { Menu.platformGames() }
      menu.choice("Special Report") { secretSpecialReport() }
      menu.choice("Back to Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.secretSpecialReport
    puts "\nWhich report would you like?"
    choose do |menu|
      menu.choice("Worth of All Titles") { Report.allTitles() } #done
      menu.choice("Worth By Specific Title") { Menu.worthBySpecificTitle() } #done
      menu.choice("Worth By Platform") { Menu.worthByPlatformMenu() } #done
      menu.choice("Worth By Series") { Report.worthBySeries() } #done
      menu.choice("Worth By Developer") { Report.worthByDeveloper() } #done
      menu.choice("Worth By Publisher") { Report.worthByPublisher() } #done
      menu.choice("Worth By Release Year") { Report.worthByReleaseYear() } #done
      menu.choice("Total Money Gained/Lost") { Report.totalMoney() } #done
      menu.choice("Worth By Italian Plumbers") { Ascii.mario2() } #done
      menu.choice("Back to Collection Menu") { Menu.showCollectionAgain() } #done
      menu.choice("Back to Main Menu") { Menu.top() } #done
      menu.choice("Exit") { Menu.superExit() }
    end
  end

end