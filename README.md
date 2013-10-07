# Spotify

[![Build Status](https://travis-ci.org/singuerinc/puppet-spotify.png?branch=master)](https://travis-ci.org/singuerinc/puppet-spotify)

[Spotify](https://www.spotify.com/us/) Listen everywhere

Spotify works on your computer, your mobile, your tablet, and your home entertainment system.
You can even download your favorite music for when you’re offline.

## Usage

```puppet
include spotify
```

or

```puppet
class { 'spotify': version => '0.8.5.1333' }
```

## Required Puppet Modules

* `boxen`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`