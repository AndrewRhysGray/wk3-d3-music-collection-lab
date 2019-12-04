require('pg')

class Artists

attr_accessor :alias
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @alias = options['first_name']
  end




end
