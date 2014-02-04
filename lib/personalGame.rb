require 'rubygems'
require 'highline/import'
require "sqlite3"
require_relative "menu"
require_relative "ascii"
require_relative "environment"
require_relative "../models/category"

class PersonalGame
  def self.save personalGame
    database = Environment.database_connection
    game = database.execute("select * from personalGames where title = '#{personalGame[:title]}' and platform = '#{personalGame[:platform]}'")
    if game.length == 1
      puts "\n\s\s\s\sYou've already entered this game."
    else
      database.execute("insert into personalGames(title, platform, purchasePrice) values('#{personalGame[:title]}', '#{personalGame[:platform]}', #{personalGame[:purchasePrice]})")
      puts "\n
      Successfully added #{personalGame[:title]} (#{personalGame[:platform]}) for $#{personalGame[:purchasePrice]}!"
    end
    Menu.done()
  end
end