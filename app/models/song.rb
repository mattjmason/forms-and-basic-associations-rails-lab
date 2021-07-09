class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
     self.genre ? self.genre.name : nil
  end
  
  def note_contents=(contents)
    contents.each do |content|
         self.notes.build(content: content)
    end
  end

  def note_contents
    self.notes.collect
  end
end
