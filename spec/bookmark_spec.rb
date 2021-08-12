# in spec/bookmark_spec.rb

describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
   
      # Add the test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
   
      bookmarks = Bookmark.all
   
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
     end
   end

  # in spec/bookmark_spec.rb

# in spec/bookmark_spec.rb

describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Test Bookmark').first
  
      expect(bookmark['url']).to eq 'http://www.example.org'
      expect(bookmark['title']).to eq 'Test Bookmark'
    end
  end
  
  
  