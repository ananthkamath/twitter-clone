class LikesController < ApplicationController
  before_action :like_exists
  def toggle
    Rails.logger.info('*'*100)
    Rails.logger.info(@like)
    Rails.logger.info('*'*100)
    if @like.nil?
      like
    else
      unlike
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :tweet_id)
  end

  def like
    @like = Like.new(like_params)
    if @like.save
      redirect_to tweets_path
    else
      redirect_to tweets_path
    end
  end

  def unlike
    if @like.destroy
      redirect_to tweets_path
    else
      redirect_to tweets_path
    end
  end

  def like_exists
    Rails.logger.info('*'*100)
    Rails.logger.info(params[:user_id])
    Rails.logger.info(params[:tweet_id])
    Rails.logger.info('*'*100)
    @like = Like.find_by(user_id: like_params[:user_id], tweet_id: like_params[:tweet_id])
  end
end
