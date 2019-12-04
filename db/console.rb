require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')

artist1 = Artist.new({
  'alias' => 'Aphex twin'
  })

  artist2 = Artist.new({
    'alias' => 'Chvrches'
    })


  album1 = Album.new({
    'album' => 'Selected Ambient Works',
    'genre' => 'IDM'
    })

  album2 = Album.new({
    'album' => 'Selected Ambient Works 2',
    'genre' => 'IDM'
    })

  album3 = Album.new({
    'album' => 'Love is dead',
    'genre' => 'Synth-pop'
    })

    artist1.save()

    album1.save()


binding.pry
nil
