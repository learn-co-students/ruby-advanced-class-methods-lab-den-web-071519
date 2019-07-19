require "pry"

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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name (name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name (name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename (filename)
    title = filename.split(" - ")
    artist_name = title[0]
    song_mp3 = title[1]
    song_array = song_mp3.split(".")
    song_name = song_array[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename (filename)
    title = filename.split(" - ")
    artist_name = title[0]
    song_mp3 = title[1]
    song_array = song_mp3.split(".")
    song_name = song_array[0]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end
end
