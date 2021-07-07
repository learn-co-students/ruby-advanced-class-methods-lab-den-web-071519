require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
     song = Song.new
     @@all << song
     song
  end
  
  def self.new_by_name newName
    song = Song.new
    song.name = newName
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create_by_name name
    song = new_by_name name
    @@all << song
    song
  end

  def self.find_by_name name
    @@all.find {|song|song.name == name}
  end

  def self.find_or_create_by_name name
    if find_by_name(name) != nil
      return find_by_name(name)
    end
    create_by_name(name)
  end

  def self.alphabetical
      @@all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename name
     arr = []
     nameCopy = name
     arr = nameCopy.chomp(".mp3")
     arr = arr.split('-')
     arr.each do |words|
      words.strip!
     end

     song = create

     song.name = arr[1]
     song.artist_name = arr[0]
     song
  end

  def self.create_from_filename name
     song = new_from_filename name
     @@all << song
  end

  def self.destroy_all
    @@all.clear
  end
end
