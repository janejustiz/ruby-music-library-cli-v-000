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
    Song.all.sort_by!{|word| word.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by!{|word| word.name}.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by!{|word| word.name}.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    music = Song.all.find_all {|song| song.artist == input}.sort_by!{|song| song.name}
    music.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
  end

  def play_song
    puts "Which song number would you like to play?"
  end
end
