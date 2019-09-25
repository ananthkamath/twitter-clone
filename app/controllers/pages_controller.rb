class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def home
    @tweets = current_user.tweets.all.order('created_at DESC')
  end

  def profile
    @tweets = current_user.tweets.all.order('created_at DESC')
  end

  def explore
  end

  def notifications
  end

  def messages
  end
end
