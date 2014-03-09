# This is a placeholder class.
class spotify() {

  $file1="/Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive"
  $file2="/Users/${::luser}/Library/Application Support/Spotify/Spotify_new.archive.sig"

  package { 'spotify':
    provider => 'appdmg',
    source   => "https://dl.dropboxusercontent.com/u/311265/apps/Spotify.dmg"
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
    command => "chflags uchg '${file1}'",
    cwd     => "/Users/${::luser}/Library/Application Support/Spotify",
    path    => ['/usr/bin', '/usr/sbin'],
    require => File['Spotify_new']
  }

  exec { 'spotify_2':
    command => "chflags uchg '${file2}'",
    cwd     => "/Users/${::luser}/Library/Application Support/Spotify",
    path    => ['/usr/bin', '/usr/sbin'],
    require => File['Spotify_new_sig']
  }
}
