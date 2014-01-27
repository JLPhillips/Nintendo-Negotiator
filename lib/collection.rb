require 'rubygems'
require 'highline/import'
require_relative 'personalGame'
require_relative 'menu'
require_relative 'report'

class Collection
  def self.showCollection
    puts "\nHow would you like to see your collection?"
    choose do |menu|
      menu.choice("All Games") { allGames() }
      menu.choice("Special Report") { Menu.specialReport() }
      menu.choice("Back to Main Menu") { Menu.top() }
      menu.choice("Exit") { exit }
    end
  end

  def self.editCollection
    puts "\nHow would you like to edit your collection?"
    choose do |menu|
      menu.choice("Edit a Game") { deleteGame() }
      menu.choice("Delete a Game") { editGame() }
      menu.choice("Back to Main Menu") { Menu.top() }
      menu.choice("Exit") { exit }
    end
  end

  def self.deleteGame
    puts "\nComing soon!"
    Menu.regular()
  end

  def self.editGame
    puts "\nComing soon!"
    Menu.regular()
  end

  def self.allGames
    puts "\nALL OF THE GAMES"
    Menu.regular()
  end
end