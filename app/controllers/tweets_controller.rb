class TweetsController < ApplicationController

    before_action :get_tweet, only: [:show, :update, :destroy]

    def index
        render json: {status: 200, tweets: Tweet.all}
    end

    def show
        tweet = Tweet.find(params[:id])
        render(json: { tweet: tweet })
    end

    def create
        tweet = Tweet.new(tweet_params)
    
        if tweet.save
           render status: 201, json: { tweet: tweet }
        else
           render(status: 422, json: { tweet: tweet, errors: tweet.errors })
        end
      end

      
    private

    def tweet_params
        params.require(:tweet).permit(:title, :content, :author)
    end

    def get_tweet
        @book = Tweet.find(params[:id])
    end
end