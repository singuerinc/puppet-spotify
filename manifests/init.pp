# This is a placeholder class.
class spotify($version='0.8.5.1333') {
  package { 'spotify':
    provider => 'appdmg_eula',
    source   => "https://www.dropbox.com/s/b4ml7cdaquzw07h/Spotify_${version}.dmg"
  }

  file { "Spotify_new_archive" :
    path    => "/Users/${::luser}/Library/Application\ Support/Spotify/Spotify_new.archive"
    ensure  => file,
    owner   => "${::luser}",
    recurse => true,
  }

  file { "Spotify_new_archive_sig" :
    path    => "/Users/${::luser}/Library/Application\ Support/Spotify/Spotify_new.archive.sig"
    ensure  => file,
    owner   => "${::luser}",
    recurse => true,
  }

  exec { "spotify_1":
    command => "chflags uchg /Users/${::luser}/Library/Application\ Support/Spotify/Spotify_new.archive",
    cwd     => "/Users/${::luser}/Library/Application\ Support/Spotify",
    path    => ["/usr/bin", "/usr/sbin"],
    require => Exec['Spotify_new_archive']
  }

  exec { "spotify_2":
    command => "chflags uchg /Users/${::luser}/Library/Application\ Support/Spotify/Spotify_new.archive.sig",
    cwd     => "/Users/${::luser}/Library/Application\ Support/Spotify",
    path    => ["/usr/bin", "/usr/sbin"],
    require => Exec['Spotify_new_archive_sig']
  }
}