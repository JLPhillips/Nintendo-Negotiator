require 'rubygems'
require 'highline/import'
require_relative "menu"
require_relative "ascii"

class PersonalGame
  def self.new
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
            menu.choices("NES", "SNES", "Virtual Boy", "Nintendo 64", "Gamecube", "Wii", "Wii U") do |chosen|
              personalGame[:platform] = chosen
            end
          end
        elsif system == "Virtual Boy"
          personalGame[:platform] = chosen
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

    personalGame[:title] = ask("\nTitle?", String)

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
      menu.choice("Go to Main Menu") { Menu.regular() }
      menu.choice("Exit") { exit }
    end
  end

  def self.save personalGame
    #SQL code (to add personalGame to the personalGames table) goes here.
    personalGames = Array.new
    personalGames << personalGame
    puts "\n
    Successfully added #{personalGame[:title]} (#{personalGame[:platform]})
    in #{personalGame[:condition]} condition for $#{personalGame[:purchasePrice]}!"
    Menu.done()
  end
end