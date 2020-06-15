require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song 
  end

  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save 
    song 
  end

  def self.find_by_name(name)
    song = self.all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    # if .find_by_name returns true then return .create_by_name
    song = self.create_by_name(name) unless song 
    # return either the found song or the created song
    song 
  end

  def self.alphabetical
    alabetized_songs = self.all.sort_by {|song| song.name[0]}
  end

  def self.new_from_filename(file_name)
    parsed_file_name = file_name.split(" - ")
    artist_name = parsed_file_name[0]
    name = parsed_file_name[1].split(".")[0]
    # binding.pry
    song = self.new_by_name(name)
    song.artist_name = artist_name
    song 
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end

  def self.destroy_all
    self.all.clear 
  end
end
