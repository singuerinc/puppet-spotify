# This is a placeholder class.
class spotify($version='0.8.5.1333') {
  package { 'spotify':
    provider => 'appdmg_eula',
    source   => "https://www.dropbox.com/s/b4ml7cdaquzw07h/Spotify_${version}.dmg"
  }

  file {'Spotify_new_archive':
      ensure  => present,
      path    => "/Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive",
      mode    => '0640',
      content => '',
      require => Package['spotify']
  }

  file {'Spotify_new_archive_sig':
      ensure  => present,
      path    => "/Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive.sig",
      mode    => '0640',
      content => '',
      require => Package['spotify']
  }

  exec { 'spotify_setup_1':
    command => "chflags uchg /Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive",
    require => File['Spotify_new_archive']
  }

  exec { 'spotify_setup_2':
    command => "chflags uchg /Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive.sig",
    require => File['Spotify_new_archive_sig']
  }
}