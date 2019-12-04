require('pg')
require_relative('../db/sql_runner')

class Album

attr_accessor :title, :genre
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "
    INSERT INTO albums
    (
      title,
      genre,
      artist_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM albums'
    SqlRunner.run(sql)
  end

  def self.select_all()
    sql = 'SELECT * FROM albums'
    album_hashes = SqlRunner.run(sql)
    albums = album_hashes.map{|album| Album.new(album)}
    return albums
  end


def artist()
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [@artist_id]
  results = SqlRunner.run(sql, values)[0]
  artist = Artist.new(results)
  return artist
end

end
