class MusicLibraryController
  def initialize(path = './db/mp3s')
    x = MusicImporter.new(path)
    x.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    counter = 0
    loop do
      counter +=1
      input = gets.strip

      if input == "exit" || counter == 4
        break
      elsif input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == "list genres"
        self.list_genres
      elsif input == "list artist"
        self.list_songs_by_artist
      elsif input == "list genre"
        self.list_songs_by_genre
      elsif input == "play song"
        self.play_song
      end
    end
  end

  def list_songs
    Songs.all.each_with_index do |song, index|
      puts "#{index}. #{song.artist} - #{song.name} - #{song.genre}"
    end
  end

  def list_artists

  end

  def list_songs_by_artist

  end

  def list_songs_by_genre

  end

  def list_songs_by_genre

  end

  def play_song

  end
end