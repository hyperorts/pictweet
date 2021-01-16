class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all_tweets
  end
end
