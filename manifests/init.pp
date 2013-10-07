# This is a placeholder class.
class spotify($version='0.8.5.1333') {
  package { 'spotify':
    provider => 'appdmg_eula',
    source   => "https://www.dropbox.com/s/b4ml7cdaquzw07h/Spotify_${version}.dmg"
  }

  file { 'Spotify_new' :
    path    => "/Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive",
    ensure  => file,
    owner   => "${::luser}"
  }

  file { 'Spotify_new_sig' :
    path    => "/Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive.sig",
    ensure  => file,
    owner   => "${::luser}"
  }

  exec { 'spotify_1':
    command => "chflags uchg /Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive",
    cwd     => "/Users/${::luser}/Library/Application Support/Spotify",
    path    => ['/usr/bin', '/usr/sbin'],
    require => File['Spotify_new']
  }

  exec { 'spotify_2':
    command => "chflags uchg /Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive.sig",
    cwd     => "/Users/${::luser}/Library/Application Support/Spotify",
    path    => ['/usr/bin', '/usr/sbin'],
    require => File['Spotify_new_sig']
  }
}