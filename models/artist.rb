require('pg')
require_relative('../db/sql_runner')

class Artist

attr_accessor :alias
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @alias = options['alias']
  end

  def save()
    sql = "INSERT INTO artists
    (
      alias
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@alias]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM artists'
    SqlRunner.run(sql)
  end

  def self.select_all()
    sql = 'SELECT * FROM artists'
    artist_hashes = SqlRunner.run(sql)
    albums = artist_hashes.map{|artist| Artist.new(artist)}
    return albums
  end

  def albums()
    sql = 'SELECT * FROM albums WHERE artist_id = $1'
    values = [@id]
    album_hashes = SqlRunner.run(sql, values)
    albums = album_hashes.map{|album| Album.new(album)}
    return albums
  end
end
