require 'spec_helper'
describe 'spotify' do

  it do
    should contain_package("spotify").with({
        :provider => 'compressed_app',
        :source   => "https://dl.dropboxusercontent.com/u/311265/apps/Spotify.zip"
    })
  end
end
