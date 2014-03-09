require 'spec_helper'
describe 'spotify' do

  it do
    should contain_package("spotify").with({
        :provider => 'appdmg',
        :source   => "https://dl.dropboxusercontent.com/u/311265/apps/Spotify.dmg"
    })
  end
end
