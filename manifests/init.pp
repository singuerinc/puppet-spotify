# This is a placeholder class.
class spotify($version='0.8.5.1333') {
  package { 'spotify':
    provider => 'appdmg',
    source   => "https://www.dropbox.com/s/b4ml7cdaquzw07h/Spotify_${version}.dmg"
  }

  exec { 'spotify_setup_1':
    command => 'touch ~/Library/Application Support/Spotify/Spotify_new.archive',
    unless  => 'test -e ~/Library/Application Support/Spotify/Spotify_new.archive'
  }

  exec { 'spotify_setup_2':
    command => 'chflags uchg ~/Library/Application Support/Spotify/Spotify_new.archive',
    unless  => 'test -e ~/Library/Application Support/Spotify/Spotify_new.archive'
  }

  exec { 'spotify_setup_3':
    command => 'touch ~/Library/Application Support/Spotify/Spotify_new.archive.sig',
    unless  => 'test -e ~/Library/Application Support/Spotify/Spotify_new.archive.sig'
  }

  exec { 'spotify_setup_4':
    command => 'chflags uchg ~/Library/Application Support/Spotify/Spotify_new.archive.sig',
    unless  => 'test -e ~/Library/Application Support/Spotify/Spotify_new.archive.sig'
  }

}