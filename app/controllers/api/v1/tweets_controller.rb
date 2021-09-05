class Api::V1::TweetsController < ActionController::API
  #skip_before_action :verify_authenticity_token
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: "alice", password: "abcd1234", except: :index

  def news
    @tweets = Tweet.eager_load(:likes).last(50)
    @b = []
    @tweets.each do |tweet|
        @b << { id: tweet.id, 
                content: tweet.content,
                user_id: tweet.user_id,
                like_count: tweet.likes.count,
                retweets_count: tweet.rt_count,
                retwitted_from: tweet.rt_from 
              }
    end
    render json: @b
  end
  
  def by_date
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @tweets_by_date = Tweet.where('created_at BETWEEN ? AND ?', @start_date, @end_date)
    @b = []
    @tweets_by_date.each do |tweet|
        @b << { id: tweet.id, 
                content: tweet.content,
                user_id: tweet.user_id,
                like_count: tweet.likes.count,
                retweets_count: tweet.rt_count,
                retwitted_from: tweet.rt_from 
              }
    end
    render json: @b
  end

  # tweet_from_api.json //  THIS REQUEST CREATE BY DEFAULT A TWEET WITH USER_ID '2' //
  def tweet_from_api
    @tweet_api = User.find(2).tweets.create(tweet_params)
    render json: @tweet_api
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end


end
