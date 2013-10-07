# This is a placeholder class.
class spotify($version='0.8.5.1333') {

  $file1="/Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive"
  $file2="/Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive.sig"

  package { 'spotify':
    provider => 'appdmg_eula',
    source   => "https://www.dropbox.com/s/b4ml7cdaquzw07h/Spotify_${version}.dmg"
  }

  file { 'Spotify_new' :
    path    => "${file1}",
    ensure  => file,
    owner   => "${::luser}"
  }

  file { 'Spotify_new_sig' :
    path    => "${file2}",
    ensure  => file,
    owner   => "${::luser}"
  }

  exec { 'spotify_1':
    command => "chflags uchg ${file1}",
    cwd     => "/Users/${::luser}/Library/Application Support/Spotify",
    path    => ['/usr/bin', '/usr/sbin'],
    require => File['Spotify_new']
  }

  exec { 'spotify_2':
    command => "chflags uchg ${file2}",
    cwd     => "/Users/${::luser}/Library/Application Support/Spotify",
    path    => ['/usr/bin', '/usr/sbin'],
    require => File['Spotify_new_sig']
  }
}