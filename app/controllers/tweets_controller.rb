class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy]

  # GET /tweets or /tweets.json
  def index
    if params[:q]
      @tweets = Tweet.where('content LIKE ?', "%#{params[:q]}%").order(id: :desc).page(params[:page])
    else
      @tweets = Tweet.eager_load(:likes).order(id: :desc).page(params[:page])
    end
    @tweet = Tweet.new
    if user_signed_in? 
      @users = User.all
    end
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.create(tweet_params)
    @tweet.user = current_user

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: "Tweet was successfully created." }
        format.json { render @tweet, status: :created}
      else
        format.html { redirect_to root_path, notice: "Content can't be blank" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def retweet
    @tweet = Tweet.find(params[:id])
    rt = Tweet.create(main_id: @tweet.id, content: "RT: @#{@tweet.user.name}: '#{@tweet.content}' ", user: current_user)
    redirect_to root_path
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :main_id)
    end
end
