class LikesController < ApplicationController
    before_action :find_tweet
    before_action :find_like, only: [:destroy]

    def create
        if liked?
          flash[:notice] = "Not permit"
        else
          @tweet.likes.create(user_id: current_user.id)
        end
        redirect_to tweets_path
    end

    def destroy
        if !(liked?)
          flash[:notice] = "Not permit"
        else
          @like.destroy
        end
        redirect_to tweets_path
    end

    private

    def liked?
        Like.where(user_id: current_user.id, tweet_id:
        params[:tweet_id]).exists?
    end

    def find_tweet
     @tweet = Tweet.find(params[:tweet_id])
    end

    def find_like
        @like = @tweet.likes.find(params[:id])
    end

 end