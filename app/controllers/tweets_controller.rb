class TweetsController < ApplicationController
#def editとshow
#@tweet = Tweet.find(params[:id])←これが重複しているため、before_action記述で１つにまとめる↓
#end
  before_action :set_tweet, only: [:edit, :show]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
    #before_actionで省略　@tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
    #before_actionで省略　@tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
  end
#↓の記述でbefore_actionと組み合わせる
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end