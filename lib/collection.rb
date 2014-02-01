require 'rubygems'
require 'highline/import'
require 'sqlite3'
require_relative 'environment'
require_relative 'personalGame'
require_relative 'menu'
require_relative 'report'

class Collection

  def self.showCollection
    Menu.showCollection()
  end

  def self.editCollection
    Menu.editCollection()
  end

  def self.deleteGame
    #SQL code for searching and deleting items from a table.
    puts "\nComing soon!"
    Menu.regular()
  end

  def self.editGame
    #SQL code for searching end editing items from a table.
    puts "\nComing soon!"
    Menu.regular()
  end

  def self.allGames
    database = Environment.database_connection
    games = database.execute('select * from personalGames order by title')
    puts "\n"
    games.each do |game|
      puts "    #{game[1]} (#{game[2]}) for $#{game[3]}"
    end
    Menu.showCollectionAgain()
  end

  def self.byPlatform platform
    database = Environment.database_connection
    if platform == "NES"
      games = database.execute('select * from personalGames where platform = "NES" order by title')
    elsif platform == "SNES"
      games = database.execute('select * from personalGames where platform = "SNES" order by title')
    elsif platform == "Nintendo 64"
      games = database.execute('select * from personalGames where platform = "Nintendo 64" order by title')
    elsif platform == "Gamecube"
      games = database.execute('select * from personalGames where platform = "Gamecube" order by title')
    elsif platform == "Wii"
      games = database.execute('select * from personalGames where platform = "Wii" order by title')
    elsif platform == "Wii U"
      games = database.execute('select * from personalGames where platform = "Wii U" order by title')
    elsif platform == "Gameboy"
      games = database.execute('select * from personalGames where platform = "Gameboy" order by title')
    elsif platform == "Gameboy Color"
      games = database.execute('select * from personalGames where platform = "Gameboy Color" order by title')
    elsif platform == "GBA"
      games = database.execute('select * from personalGames where platform = "GBA" order by title')
    elsif platform == "DS"
      games = database.execute('select * from personalGames where platform = "DS" order by title')
    elsif platform == "3DS"
      games = database.execute('select * from personalGames where platform = "3DS" order by title')
    else
      games = database.execute('select * from personalGames where platform = "Virtual Boy" order by title')
    end
    puts "\n"
    games.each do |game|
      puts "    #{game[1]} (#{game[2]}) for $#{game[3]}"
    end
    Menu.showCollectionAgain()
  end
end