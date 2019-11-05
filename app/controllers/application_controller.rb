class ApplicationController < ActionController::Base

  require 'flickraw'
  require 'json'

  def cat
    FlickRaw.api_key = ENV['FLICKR_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SECRET']
    result = flickr.photos.search(:tags => 'cat')
    random = Random.new
    num = random.rand(0..result.length)
    @image = "https://farm#{result[num].farm}.staticflickr.com/#{result[num].server}/#{result[num].id}_#{result[num].secret}.jpg"
  end
end
