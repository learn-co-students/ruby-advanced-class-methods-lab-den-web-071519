require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

## when to use self.class.all vs. self...
## the reason why we use self.class below has to do with the fact that we're in
## an instance method, not a class method. If we were in a class method, we
## would only have to write self.

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new # new_song = Song.new ## creates a new instance.
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.find_by_name(song_name)
    song = @@all.find {|instance| instance.name == song_name}
    song
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      song = self.find_by_name(song_name)
    else
      song = self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    new_array = @@all.sort_by {|instance| instance.name }
    new_array
  end

  def self.new_from_filename(file_name)
    new_song = self.new # new instance
    song_parsed = file_name.chomp(".mp3").split(" - ") # parse file_name
    new_song.artist_name = song_parsed[0] # set both instance variables.
    new_song.name = song_parsed[1]
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.create # new creation instance
    song_parsed = file_name.chomp(".mp3").split(" - ") # parse file_name
    new_song.artist_name = song_parsed[0] # set both instance variables.
    new_song.name = song_parsed[1]
    new_song
  end

  def self.destroy_all
    @@all.clear
  end 

  # binding.pry


end
