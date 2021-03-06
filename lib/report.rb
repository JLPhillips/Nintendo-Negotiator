require 'rubygems'
require 'highline/import'
require_relative 'personalGame'
require_relative 'collection'
require_relative 'menu'

class Report
  def self.allTitles
    database = Environment.database_connection
    sum = database.execute("select sum(ebayPrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title")
    ebaySum = sum.join("").to_i
    if ebaySum <= 0
      puts "\n\s\s\s\sYou haven't entered any games."
      puts Menu.specialReportMenu()
    else
      purchaseSum = database.execute("select sum(purchasePrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title")
      purchaseSum = purchaseSum.join("").to_i
      totalSum = ebaySum - purchaseSum
      puts "\n\s\s\s\sYour collection is worth $#{ebaySum}!"
      puts "\n\s\s\s\sYou paid $#{purchaseSum}."
      if totalSum <= 0
        puts "\n\s\s\s\sI would hang on to those."
      elsif totalSum > 0
        puts "\n\s\s\s\sSell! SELL!!"
      else
        puts "Error."
      end
    end
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("See Individual Worth of All Titles") { allTitlesSpecific() }
      menu.choice("Go Back To Special Reports") { Menu.specialReport() }
      menu.choice("Go Back To See Your Collection") { Collection.showCollection() }
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.allTitlesSpecific
    database = Environment.database_connection
    games = database.execute("select * from personalGames pG inner join nintendoGames nG on pG.title = nG.title where pG.platform = nG.platform order by title")
    puts "\n"
    if games.length < 1
      puts "\s\s\s\sYou have no games entered."
    else
      games.each do |game|
        puts "\s\s\s\s#{game[1]} (#{game[2]}) worth $#{game[10]} (paid $#{game[3]})"
      end
    end
    Menu.specialReportMenu()
  end

  def self.worthByPlatform searchQuery
    database = Environment.database_connection
    sum = database.execute("select sum(ebayPrice) from personalGames pG inner join nintendoGames nG on pG.title = nG.title where pG.platform = '#{searchQuery[:query]}'")
    ebaySum = sum.join("").to_i
    if ebaySum <= 0
      puts "\n\s\s\s\sYou haven't entered any games for this platform."
      puts Menu.specialReportMenu()
    else
      purchaseSum = database.execute("select sum(purchasePrice) from personalGames pG inner join nintendoGames nG on pG.title = nG.title where pG.platform = '#{searchQuery[:query]}'")
      purchaseSum = purchaseSum.join("").to_i
      totalSum = ebaySum - purchaseSum
      puts "\n\s\s\s\sYour collection of games for the #{searchQuery[:query]} is worth $#{ebaySum}!"
      puts "\n\s\s\s\sYou paid $#{purchaseSum}."
      if totalSum <= 0
        puts "\n\s\s\s\sI would hang on to those."
      elsif totalSum > 0
        puts "\n\s\s\s\sSell! SELL!!"
      else
        puts "Error."
      end
    end
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("See Specific Games For This Platform") { specificGamesOnPlatform(searchQuery) }
      menu.choice("Go Back To Special Reports") { Menu.specialReport() }
      menu.choice("Go Back To See Your Collection Menu") { Collection.showCollection() }
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.specificGamesOnPlatform searchQuery
    database = Environment.database_connection
    games = database.execute("select * from personalGames pG inner join nintendoGames nG on pG.title = nG.title where pG.platform = '#{searchQuery[:query]}' order by title")
    puts "\n"
    if games.length < 1
      puts "\s\s\s\sYou have no games for the #{searchQuery[:query]}."
    else
      games.each do |game|
        puts "\s\s\s\s#{game[1]} (#{game[2]}) worth $#{game[10]} (paid $#{game[3]})"
      end
    end
    Menu.specialReportMenu()
  end

  def self.worthBySpecificTitle searchQuery
    database = Environment.database_connection
    games = database.execute("select * from personalGames pG inner join nintendoGames nG on pG.title = nG.title where pG.title = '#{searchQuery[:title]}' and pG.platform = '#{searchQuery[:platform]}'")
    if games.length < 1
      puts "\n\s\s\sYou have not entered this game."
    else
      games.each do |game|
        puts "\s\s\s\s#{game[1]} (#{game[2]}) worth $#{game[10]} (paid $#{game[3]})"
      end
    end
    Menu.specialReportMenu()
  end

  def self.worthBySeries
    searchQuery = {}
    searchQuery[:series] = ask("\nWhich game series?", String)
    database = Environment.database_connection
    sum = database.execute("select sum(ebayPrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where series = '#{searchQuery[:series]}'")
    ebaySum = sum.join("").to_i
    if ebaySum <= 0
      puts "\n\s\s\s\sYou haven't entered any games in this series."
      puts Menu.specialReportMenu()
    else
      purchaseSum = database.execute("select sum(purchasePrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where series = '#{searchQuery[:series]}'")
      purchaseSum = purchaseSum.join("").to_i
      totalSum = ebaySum - purchaseSum
      puts "\n\s\s\s\sYour collection of games in the #{searchQuery[:query]} series is worth $#{ebaySum}!"
      puts "\n\s\s\s\sYou paid $#{purchaseSum}."
      if totalSum <= 0
        puts "\n\s\s\s\sI would hang on to those."
      elsif totalSum > 0
        puts "\n\s\s\s\sSell! SELL!!"
      else
        puts "Error."
      end
    end
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("See Specific Games In This Series") { worthBySeriesSpecific(searchQuery) }
      menu.choice("Go Back To Special Reports") { Menu.specialReport() }
      menu.choice("Go Back To See Your Collection") { Collection.showCollection() }
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.worthBySeriesSpecific searchQuery
    database = Environment.database_connection
    games = database.execute("select * from personalGames pG inner join nintendoGames nG on pG.title = nG.title where nG.series = '#{searchQuery[:series]}'")
    if games.length < 1
      puts "\n\s\s\sYou have not entered any games in this series."
    else
      puts "\n"
      games.each do |game|
        puts "\s\s\s\s#{game[1]} (#{game[2]}) worth $#{game[10]} (paid $#{game[3]})"
      end
    end
    Menu.specialReportMenu()
  end

  def self.worthByDeveloper
    searchQuery = {}
    searchQuery[:query] = ask("\nWhich developer?", String)
    database = Environment.database_connection
    sum = database.execute("select sum(ebayPrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where developer like '%#{searchQuery[:query]}%'")
    ebaySum = sum.join("").to_i
    if ebaySum <= 0
      puts "\n\s\s\s\sYou haven't entered any games from this developer."
      puts Menu.specialReportMenu()
    else
      purchaseSum = database.execute("select sum(purchasePrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where developer like '%#{searchQuery[:query]}%'")
      purchaseSum = purchaseSum.join("").to_i
      totalSum = ebaySum - purchaseSum
      puts "\n\s\s\s\sYour collection of games developed by #{searchQuery[:query]} is worth $#{ebaySum}!"
      puts "\n\s\s\s\sYou paid $#{purchaseSum}."
      if totalSum <= 0
        puts "\n\s\s\s\sI would hang on to those."
      elsif totalSum > 0
        puts "\n\s\s\s\sSell! SELL!!"
      else
        puts "Error."
      end
    end
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("See Specific Games By This Developer") { specificGamesByDeveloper(searchQuery) }
      menu.choice("Go Back To Special Reports") { Menu.specialReport() }
      menu.choice("Go Back To See Your Collection") { Collection.showCollection() }
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.specificGamesByDeveloper searchQuery
    database = Environment.database_connection
    games = database.execute("select * from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where developer like '%#{searchQuery[:query]}%' order by platform, title")
    puts "\n"
    games.each do |game|
      puts "\s\s\s\s#{game[1]} (#{game[2]}) worth $#{game[10]} (paid $#{game[3]})"
    end
    Menu.specialReportMenu()
  end

  def self.worthByPublisher
    searchQuery = {}
    searchQuery[:query] = ask("\nWhich publisher?", String)
    database = Environment.database_connection
    sum = database.execute("select sum(ebayPrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where publisher like '%#{searchQuery[:query]}%'")
    ebaySum = sum.join("").to_i
    if ebaySum <= 0
      puts "\n\s\s\s\sYou haven't entered any games from this publisher."
      puts Menu.specialReportMenu()
    else
      purchaseSum = database.execute("select sum(purchasePrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where publisher like '%#{searchQuery[:query]}%'")
      purchaseSum = purchaseSum.join("").to_i
      totalSum = ebaySum - purchaseSum
      puts "\n\s\s\s\sYour collection of games published by #{searchQuery[:query]} is worth $#{ebaySum}!"
      puts "\n\s\s\s\sYou paid $#{purchaseSum}."
      if totalSum <= 0
        puts "\n\s\s\s\sI would hang on to those."
      elsif totalSum > 0
        puts "\n\s\s\s\sSell! SELL!!"
      else
        puts "Error."
      end
    end
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("See Specific Games By This Publisher") { specificGamesByPublisher(searchQuery) }
      menu.choice("Go Back To Special Reports") { Menu.specialReport() }
      menu.choice("Go Back To See Your Collection") { Collection.showCollection() }
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.specificGamesByPublisher searchQuery
    database = Environment.database_connection
    games = database.execute("select * from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where publisher like '%#{searchQuery[:query]}%' order by platform, title")
    puts "\n"
    games.each do |game|
      puts "\s\s\s\s#{game[1]} (#{game[2]}) worth $#{game[10]} (paid $#{game[3]})"
    end
    Menu.specialReportMenu()
  end

  def self.worthByReleaseYear
    searchQuery = {}
    searchQuery[:query] = ask("\nWhich release year?", String)
    database = Environment.database_connection
    sum = database.execute("select sum(ebayPrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where releaseYear = '#{searchQuery[:query]}'")
    ssum = sum.join("").to_i
    if ssum <= 0
      puts "\n\s\s\s\sYou haven't entered any games from this year."
      puts Menu.specialReportMenu()
    else
      ebaySum = database.execute("select sum(ebayPrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where nintendoGames.releaseYear = '#{searchQuery[:query]}'")
      ebaySum = ebaySum.join("").to_i
      purchaseSum = database.execute("select sum(purchasePrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where nintendoGames.releaseYear = '#{searchQuery[:query]}'")
      purchaseSum = purchaseSum.join("").to_i
      totalSum = ebaySum - purchaseSum
      puts "\n\s\s\s\sYour collection of games released in #{searchQuery[:query]} is worth $#{ssum}!"
      puts "\n\s\s\s\sYou paid $#{purchaseSum}."
      if totalSum <= 0
        puts "\n\s\s\s\sI would hang on to those."
      elsif totalSum > 0
        puts "\n\s\s\s\sSell! SELL!!"
      else
        puts "Error."
      end
    end
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("See Specific Games In This Year") { specificGamesInYear(searchQuery) }
      menu.choice("Go Back To Special Reports") { Menu.specialReport() }
      menu.choice("Go Back To See Your Collection") { Collection.showCollection() }
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.specificGamesInYear searchQuery
    database = Environment.database_connection
    games = database.execute("select * from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title where releaseYear = '#{searchQuery[:query]}' order by platform, title")
    puts "\n"
    games.each do |game|
      puts "\s\s\s\s#{game[1]} (#{game[2]}) worth $#{game[10]} (paid $#{game[3]})"
    end
    Menu.specialReportMenu()
  end

  def self.totalMoney
    database = Environment.database_connection
    ebaySum = database.execute("select sum(ebayPrice) from personalGames inner join nintendoGames on personalGames.title = nintendoGames.title")
    ebaySum = ebaySum.join("").to_i
    purchaseSum = database.execute("select sum(purchasePrice) from personalGames")
    purchaseSum = purchaseSum.join("").to_i
    totalSum = ebaySum - purchaseSum
    puts "\n\s\s\s\sYour collection's net worth is $#{totalSum}!"
    if totalSum < 0
      puts "\n\s\s\s\sOuch."
    else
      puts "\n\s\s\s\sYou're loaded!"
    end
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("Go Back To Special Reports") { Menu.specialReport() }
      menu.choice("Go Back To See Your Collection") { Collection.showCollection() }
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end

  def self.highestValueSeries
    searchQuery = {}
    database = Environment.database_connection
    series = database.execute("select series, avg(originalPrice - ebayPrice) from personalGames inner join nintendoGames on nintendoGames.title = personalGames.title order by series")
    series.each do |series|
      puts "\n\s\s\s\sThe series with the highest retained value\n\s\s\s\sin your collection is the #{series[0]} series."
      searchQuery[:series] = series[0]
    end
    puts "\nNow what would you like to do?"
    choose do |menu|
      menu.choice("See The Individual Titles In This Series.") { worthBySeriesSpecific(searchQuery) }
      menu.choice("Go Back To Special Reports") { Menu.specialReport() }
      menu.choice("Go Back To See Your Collection") { Collection.showCollection() }
      menu.choice("Go Back To Main Menu") { Menu.regular() }
      menu.choice("Exit") { Menu.superExit() }
    end
  end
end