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
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if !self.all.include?(name)
      self.create_by_name(name)
    end
    self.find_by_name(name)
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  def self.new_from_filename(file)
    song = Song.new
    new = file.split(" - ")
    song.artist_name = new[0]
    song.name = new[1].split(".mp3")[0]
    song
  end
  def self.create_from_filename(file)
    song = Song.new
    new = file.split(" - ")
    song.artist_name = new[0]
    song.name = new[1].split(".mp3")[0]
    song.save
    song
  end
  def self.destroy_all
    self.all.clear
  end
end
