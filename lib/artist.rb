require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    binding.pry
    @songs << song
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if self.all.empty?
      self.create(name)
    else
      self.all.detect do |artist|
        artist.name == name ? true : self.create(name)
      end
    end
  end

  def self.create(name)
    self.new(name).tap(&:save)
  end

  def save
    @@all << self
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end
end
