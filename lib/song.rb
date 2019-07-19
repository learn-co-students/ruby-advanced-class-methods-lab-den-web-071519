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
    @@all << new_song = self.new
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort{|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(file)
    delimiters = ['-', '.']
    split = file.split(Regexp.union(delimiters))
    song = self.create_by_name(split[1].strip)
    song.artist_name = split[0].strip
    song
  end

  def self.create_from_filename(file)
    delimiters = ['-', '.']
    split = file.split(Regexp.union(delimiters))
    song = self.create_by_name(split[1].strip)
    song.artist_name = split[0].strip
    song
  end

  def self.destroy_all
    @@all.clear
  end

end


