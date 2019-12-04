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




end
