require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
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
        if artist.name == name
          true
        else
          self.create(name)
      end
    end
    binding.pry
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
