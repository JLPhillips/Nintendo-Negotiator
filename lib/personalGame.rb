require 'rubygems'
require 'highline/import'
require_relative "menu"

class PersonalGame
  def self.new
    personalGame = {}

    personalGame[:title] = ask("\nTitle?", String)

    puts "\nConsole or Handheld?"
    choose do |menu|
      menu.choices("Console", "Handheld") do |chosen|
        system = chosen
        puts "\n"
        if system == "Console"
          puts "Which one?"
          choose do |menu|
            menu.choices("NES", "SNES", "N64", "GCN", "Wii", "Wii U") do |chosen|
              personalGame[:platform] = chosen
            end
          end
        else
          puts "Which one?"
          choose do |menu|
            menu.choices("Gameboy", "GBA", "DS", "3DS") do |chosen|
              personalGame[:platform] = chosen
            end
          end
        end
      end
    end

    puts "\nCurrent condition?"
    choose do |menu|
      menu.choices("New", "Like New", "Very Good", "Good", "Acceptable", "Poor") do |chosen|
        personalGame[:condition] = chosen
      end
    end

    personalGame[:purchasePrice] = ask("\nPrice you paid for it?", Integer)
    puts "\n"

    choose do |menu|
      menu.choice("Save Game") { save(personalGame) }
      menu.choice("Start Over") { new() }
      menu.choice("Go to Main Menu") { Menu.top() }
      menu.choice("Exit") { exit }
    end
  end

  def self.save personalGame
    #SQL code (to add personalGame to the personalGames table) goes here.
    personalGames = Array.new
    personalGames << personalGame
    puts "\nSTART"
    puts personalGames
    puts "END\n"
    Menu.regular()
  end
end