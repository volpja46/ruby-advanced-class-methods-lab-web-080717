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
    c = self.new
    c.save
    c
  end

   def self.save
     self.class.all << song
   end

# song = Song.new_by_name("Blank Space")
   def self.new_by_name(name)
      song = self.new
      song.name = name
      song
   end


  def self.create_by_name(name)
    if !Song.all.include?(name) # if song is not there...create a new one
      song = self.new_by_name(name)
      song.save
      return song
    end
  end

  def self.find_by_name(song)
     Song.all.find do |s|
    s.name == song
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

    def self.alphabetical
      @@all.sort_by { |song| song.name }
    end
    #"Taylor Swift - Blank Space.mp3"
    def self.new_from_filename(file_name)
    artist_song_correct_format = file_name.gsub(".mp3","").split(" - ")
      artist = artist_song_correct_format[0]
      song = artist_song_correct_format[1]
      # create a new song before attaching the artist!!!
      song = self.new_by_name(song) #from right above
      song.artist_name = artist
      song
    end

    def self.create_from_filename(file_name)
      if !Song.all.include?(name) # if song is not there...create a new one
        song = self.new_from_filename(file_name)
        song.save
        return song
    end
  end

  def self.destroy_all
    @@all.clear
  end
end
