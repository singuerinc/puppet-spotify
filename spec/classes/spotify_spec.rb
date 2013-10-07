require 'spec_helper'
describe 'spotify' do

  version = '0.8.5.1333'

  it do
    should contain_package("spotify").with({
        :provider => 'appdmg',
        :source   => "https://www.dropbox.com/s/b4ml7cdaquzw07h/Spotify_#{version}.dmg"
    })
  end
end