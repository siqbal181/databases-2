require "./app.rb"

RSpec.describe Application do
  it "returns a list of albums based on user prompt" do
    io = double :io
    album_repository = double :album_repository
    artist_repository = double :artist_repository
    database_name = 'music_library_test'

    application = Application.new(database_name, io, album_repository, artist_repository)

    expect(io).to receive(:puts).with("Welcome to the music library manager!\n")
    expect(io).to receive(:puts).with("What would you like to do?")
    expect(io).to receive(:puts).with("1. List all albums\n2. List all artists")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("Here is the list of albums")

    # Configure the album_repository mock object to return some expected data
    allow(album_repository).to receive(:all).and_return([
    double(title: "Doolittle"),
    double(title: "Surfer Rosa"),
    ])

    application.run
    expect(application.run).to eq("* 1 - Doolittle, * 2 - Surfer Rosa")
  end
end
