class Media
  attr_reader :comments

  def initialize
    @comments = []
  end

  def add_comment(comment)
    @comments.push(comment)
  end

  def play
    puts "Playing..."
  end
end

class Video < Media
  attr_accessor :resolution

  def initialize(resolution)
    super()
    @resolution = resolution
  end
end

class Song < Media
  attr_accessor :bpm

  def initialize(bpm)
    super()
    @bpm = bpm
  end
end

# Create a video
video = Video.new("1080p")

# Create a song
song = Song.new(120)

video.add_comment("Awesome video!")
song.add_comment("Great song!")

puts "Comments for the video:"
video.comments.each { |comment| puts "- #{comment}" }

puts "\nComments for the song:"
song.comments.each { |comment| puts "- #{comment}" }
