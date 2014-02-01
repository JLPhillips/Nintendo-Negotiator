require 'highline/import'
require_relative "menu"

class Ascii
  def self.mario
    puts "
    \s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶
    \s\s\s\s\s\s\s\s\s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
    \s\s\s\s\s\s\s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶111
    \s\s\s\s\s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶11111
    \s\s\s\s\s\s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
    \s\s\s\s\s\s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
    \s\s\s\s\s\s\s\s§§§§§§§§§11111111111111111
    \s\s\s\s\s\s\s§§§§1111§§§111111$$$111111111111
    \s\s\s\s\s\s§§§§11111§§§§§11111111111111111111
    \s\s\s\s\s§§§§§11111§§§§§§11111111111111111111
    \s\s\s\s§§§§§1111111§§§§11111111§§§§11111111
    \s\s\s\s§§§§§§1111111111111§§§§§§§§§§§§§§§§
    \s\s\s\s§§§§§§§§11111111111111§§§§§§§§§§§§§
    \s\s\s\s\s\s\s\s§§§§§§11111111111111111111111
    \s\s\s\s\s\s\s\s\s\s§§§§§1111111111111111111
    \s\s\s\s\s\s\s\s\s\s\s\s\s\s111111111111111111
    \s\s\s\s\s\s\s\s\s\s\s\s§§¶¶¶¶§§§§§§§§§§¶¶¶¶§§
    \s\s\s\s\s\s\s\s\s\s§§§§¶¶¶¶§§§§§§§§§§¶¶¶¶§§§§
    \s\s\s\s\s\s\s\s§§§§§§¶¶¶¶§§§§§§§§§§¶¶¶¶§§§§§§
    \s\s\s\s\s\s§§§§§§§§¶¶¶¶§§§§§§§§§§¶¶¶¶§§§§§§§§
    \s\s\s\s§§§§§§§§§§¶¶¶¶§§§§§§§§§§¶¶¶¶§§§§§§§§§
    \s\s\s§§§§§§§§§§¶¶¶¶¶§§§§§§§§§§¶¶¶¶¶§§§§§§§§§
    \s\s§§§§§§§§§§¶¶¶¶¶¶§§§§§§§§§§¶¶¶¶¶¶§§§§§§§§§
    \s§§§§§§§§§§§¶¶¶¶¶¶§§§§§§§§§§¶¶¶¶¶¶§§§§§§§§§§
    \s§§§§§§§§§§§¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶§§§§§§§§§§
    \s§§§§§§§§§§§¶¶¶00¶¶¶¶¶¶¶¶¶¶¶¶00¶¶¶§§§§§§§§§§
    \s11111111111¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶1111111111
    \s11111111111¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶1111111111
    \s\s1111111111¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶111111111
    \s\s\s\s11111111¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶1111111
    \s\s\s\s\s\s1111¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶1111
    \s\s\s\s\s\s\sSL¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
    \s\s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
    \s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
    \s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶\s\s\s\s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
    \s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶\s\s\s\s\s\s\s\s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶¶
    \s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶\s\s\s\s\s\s\s\s\s\s\s\s¶¶¶¶¶¶¶¶¶¶¶¶
    \s\s\s\s\s\s\s§§§§§§§§§§\s\s\s\s\s\s\s\s\s\s\s\s§§§§§§§§§§
    \s\s\s\s\s\s\s§§§§§§§§§§\s\s\s\s\s\s\s\s\s\s\s\s§§§§§§§§§§
    \s\s\s\s\s\s\s§§§§§§§§§§\s\s\s\s\s\s\s\s\s\s\s\s§§§§§§§§§§
    \s§§§§§§§§§§§§§§§§\s\s\s\s\s\s\s\s\s\s\s\s§§§§§§§§§§§§§§§§
    \s§§§§§§§§§§§§§§§§\s\s\s\s\s\s\s\s\s\s\s\s§§§§§§§§§§§§§§§§
    \s\s§§§§§§§§§§§§§§§\s\s\s\s\s\s\s\s\s\s\s\s§§§§§§§§§§§§§§§"
    Menu.regular()
  end

  def self.logo
    puts "
         _   ___       __                 __
        / | / (_)___  / /____  ____  ____/ /___
       /  |/ / / __ \\/ __/ _ \\/ __ \\/ __  / __ \\
      / /|  / / / / / /_/  __/ / / / /_/ / /_/ /
     /_/ |_/_/_/ /_/\\__/\\___/_/ /_/\\__,_/\\____/
    _   __                 __  _       __
   / | / /__  ____ _____  / /_(_)___ _/ /_____  _____
  /  |/ / _ \\/ __ `/ __ \\/ __/ / __ `/ __/ __ \\/ ___/
 / /|  /  __/ /_/ / /_/ / /_/ / /_/ / /_/ /_/ / /
/_/ |_/\\___/\\__, /\\____/\\__/_/\\__,_/\\__/\\____/_/
           /____/ "
  end

  def self.aboutLogo
    puts "
    ___    __                __
   /   |  / /_  ____  __  __/ /_
  / /| | / __ \\/ __ \\/ / / / __/
 / ___ |/ /_/ / /_/ / /_/ / /_
/_/  |_/_.___/\\____/\\__,_/\\__/
-------------------------------
-------------------------------\n"

  end

  def self.about
    aboutLogo()
    puts "
          ----------------------------------------------
         ------<NOW YOU'RE NEGOTIATING WITH POWER>-------
        --------------------------------------------------
       --- >>>>>>>Nintendo Negotiator is a used and     ---
      ---- buyback price database for all Nintendo      ----
     ----- games released in the USA for all Nintendo   -----
    ------ game systems, whether handheld or console    ------
    ------ (or whatever you count Virtual Boy as) for   ------
    ------ use of determining personal collection sell  ------
    ------ value. It allows you to quickly add your     ------
     ----- games along with what you paid for them and  -----
      ---- then get special reports on your collection! ----
       --- Navigate the menus and have some fun!>>>>>>> ---
        --------------------------------------------------
         -----------<MADE BY JL PHILLIPS 2014>-----------
          ----------------------------------------------\n"
    choose do |menu|
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.addGame
    puts "
    ___       __    __            ______
   /   | ____/ /___/ /  ____ _   / ____/___ _____ ___  ___
  / /| |/ __  / __  /  / __ `/  / / __/ __ `/ __ `__ \\/ _ \\
 / ___ / /_/ / /_/ /  / /_/ /  / /_/ / /_/ / / / / / /  __/
/_/  |_\\__,_/\\__,_/   \\__,_/   \\____/\\__,_/_/ /_/ /_/\\___/
----------------------------------------------------------
----------------------------------------------------------\n"
  end

  def self.seeCollection
    puts "
           __  __
           \\ \\/ /___  __  _______
            \\  / __ \\/ / / / ___/
            / / /_/ / /_/ / /
           /_/\\____/\\__,_/_/
   ______      ____          __  _
  / ____/___  / / /__  _____/ /_(_)___  ____
 / /   / __ \\/ / / _ \\/ ___/ __/ / __ \\/ __ \\
/ /___/ /_/ / / /  __/ /__/ /_/ / /_/ / / / /
\\____/\\____/_/_/\\___/\\___/\\__/_/\\____/_/ /_/
--------------------------------------------
--------------------------------------------\n"
  end

  def self.editCollection
    puts "
               ______    ___ __
              / ____/___/ (_) /_
             / __/ / __  / / __/
            / /___/ /_/ / / /_
           /_____/\\__,_/_/\\__/
   ______      ____          __  _
  / ____/___  / / /__  _____/ /_(_)___  ____
 / /   / __ \\/ / / _ \\/ ___/ __/ / __ \\/ __ \\
/ /___/ /_/ / / /  __/ /__/ /_/ / /_/ / / / /
\\____/\\____/_/_/\\___/\\___/\\__/_/\\____/_/ /_/
--------------------------------------------
--------------------------------------------\n"
  end

  def self.bye
    puts "
--------------------------
-----Thanks for using-----
---Nintendo Negotiator!---
--------------------------
    ____             __
   / __ )__  _____  / /
  / __  / / / / _ \\/ /
 / /_/ / /_/ /  __/_/
/_____/\\__, /\\___(_)
      /____/
\n"
  end
end