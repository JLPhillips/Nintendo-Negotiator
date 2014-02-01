require 'rubygems'
require 'highline/import'
require "sqlite3"
require_relative "menu"
require_relative "ascii"
require_relative "environment"
require_relative "../models/category"

class PersonalGame
  def self.new
    Menu.personalGame()
  end

  def self.save personalGame
    database = Environment.database_connection
    database.execute("insert into personalGames(title, platform, purchasePrice) values('#{personalGame[:title]}', '#{personalGame[:platform]}', #{personalGame[:purchasePrice]})")

    puts "\n
    Successfully added #{personalGame[:title]} (#{personalGame[:platform]}) for $#{personalGame[:purchasePrice]}!"
    Menu.done()
  end
end