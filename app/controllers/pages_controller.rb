class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_profile

  def home
    @tweets = Tweet.all.order('created_at DESC')
  end

  def explore
  end

  def notifications
  end

  def messages
  end
end
