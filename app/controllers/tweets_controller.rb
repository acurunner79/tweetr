class TweetsController < ApplicationController
    def index
        render json: {status: 200, tweets: Tweet.all}
    end

    def show
    end
end