class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(message: params[:message])
      if @tweet.save
        flash[:notice] = '1レコード追加しました'
        redirect_to tweets_path
      else
        render 'new'
      end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:notice] = '1レコード削除しました'
    redirect_to tweets_path
  end
end
