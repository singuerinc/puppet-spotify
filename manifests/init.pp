# This is a placeholder class.
class spotify($version='0.8.5.1333') {
  package { 'spotify':
    provider => 'appdmg_eula',
    source   => "https://www.dropbox.com/s/b4ml7cdaquzw07h/Spotify_${version}.dmg"
  }

  exec { "touch /Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive":
    cwd     => "/Users/${::luser}/Library/Application Support/Spotify",
    creates => "/Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive",
    path    => ["/usr/bin", "/usr/sbin"]
  }

  exec { "touch /Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive.sig":
    cwd     => "/Users/${::luser}/Library/Application Support/Spotify",
    creates => "/Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive.sig",
    path    => ["/usr/bin", "/usr/sbin"],
    unless  => 'test -e /Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive.sig'
  }

  exec { "chflags uchg /Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive":
    cwd     => "/Users/${::luser}/Library/Application Support/Spotify",
    path    => ["/usr/bin", "/usr/sbin"],
    require => File['Spotify_new_archive']
  }

  exec { "chflags uchg /Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive.sig":
    cwd     => "/Users/${::luser}/Library/Application Support/Spotify",
    path    => ["/usr/bin", "/usr/sbin"],
    require => File['Spotify_new_archive_sig']
  }
}