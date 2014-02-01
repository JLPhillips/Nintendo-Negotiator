#!/usr/bin/env ruby
# -*- ruby -*-

require 'rake/testtask'
require_relative "lib/environment"
Rake::TestTask.new() do |t|
  t.pattern = "test/test_*.rb"
end

desc "Run tests"
task :default => :test

desc 'create the production database setup'
task :bootstrap_database do
  Environment.environment = "production"
  database = Environment.database_connection
  create_tables(database)
end

def create_tables(database_connection)
  database_connection.execute("CREATE TABLE personalGames (id INTEGER PRIMARY KEY AUTOINCREMENT, title varchar(50), platform varchar(50), purchasePrice INTEGER)")
end