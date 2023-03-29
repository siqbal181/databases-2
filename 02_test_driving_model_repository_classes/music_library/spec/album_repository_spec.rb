require 'album_repository'

RSpec.describe AlbumRepository do

    def reset_albums_table
        seed_sql = File.read('spec/seeds_albums.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
      end
      
        before(:each) do 
          reset_albums_table
        end

    it 'returns a list of albums' do
        repo = AlbumRepository.new
        albums = repo.all

        expect(albums.length).to eq 2
        expect(albums.first.title).to eq('Doolittle')
        expect(albums.first.release_year).to eq('1989')
        expect(albums.first.artist_id).to eq('1')
    end

    it "returns Doolittle as a single album" do
      repo = AlbumRepository.new
      album = repo.find(1)
      expect(album.title).to eq('Doolittle')
      expect(album.release_year).to eq('1989')
    end

    it "returns Surfer Rosa as a single album" do
      repo = AlbumRepository.new
      album = repo.find(2)
      expect(album.title).to eq('Surfer Rosa')
      expect(album.release_year).to eq('1988')
    end

    it "creates a new album" do
      repo = AlbumRepository.new

      album = Album.new
      album.title = 'Hello'
      album.release_year = '1999'
      album.artist_id = '1'

      repo.create(album) # => nil
      albums = repo.all

      last_album = albums.last
      expect(last_album.title).to eq('Hello')
      expect(last_album.release_year).to eq('1999')
    end
end