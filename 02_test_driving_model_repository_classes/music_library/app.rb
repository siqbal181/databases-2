require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

class Application
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts "Welcome to the music library manager!\n"
    @io.puts "What would you like to do?"
    @io.puts "1. List all albums\n2. List all artists"
    choice = @io.gets.chomp.to_i

    if choice == 1
        @io.puts "Here is the list of albums"
        @album_repository.all.each_with_index do |album, index|
            @io.puts "* #{index+1} - #{album.title}"
        end
    elsif choice == 2
        @io.puts "Here are the list of artists"
        @artist_repository.all.each_with_index do |artist, index|
            @io.puts "* #{index+1} - #{artist.name}"
        end
    end
end
end

if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    AritstsRepository.new
  )
  app.run
end