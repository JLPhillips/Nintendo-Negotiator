require 'csv'
require_relative 'category'
require_relative 'personalGame'

class Importer
  def self.import(from_filename)
    CSV.foreach(from_filename, headers: true) do |row_hash|
      import_product(row_hash)
    end
  end

  def self.import_product(row_hash)
    category = Category.find_or_create(row_hash["category"])
    personalGame = PersonalGame.create(
      title: row_hash["title"],
      platform: row_hash["platform"],
      developer: row_hash["developer"],
      publisher: row_hash["publisher"],
      releaseYear: row_hash["releaseYear"].to_i,
      originalPrice: row_hash["originalPrice"].to_i
    )
  end
end