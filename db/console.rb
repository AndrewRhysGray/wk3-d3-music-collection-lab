require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')


Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'alias' => 'Aphex twin'
})

artist2 = Artist.new({
  'alias' => 'Chvrches'
})

artist1.save()
artist2.save()

album1 = Album.new({
  'title' => 'Selected Ambient Works',
  'genre' => 'IDM',
  'artist_id' => artist1.id
})

album2 = Album.new({
  'title' => 'Selected Ambient Works 2',
  'genre' => 'IDM',
  'artist_id' => artist1.id
})

album3 = Album.new({
  'title' => 'Love is dead',
  'genre' => 'Synth-pop',
  'artist_id' => artist2.id
})

album1.save()
album2.save()
album3.save()

binding.pry
nil
