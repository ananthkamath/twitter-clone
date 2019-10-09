class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_current_profile

  def show
    @user = @profile.user
    @tweets = @user.tweets.all.order('created_at DESC')
  end

  def new
    @profile = current_user.build_profile
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @profile.avatar.attach(params[:avatar])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to user_profile_path, notice: 'Profile was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      @profile.avatar.attach(params[:avatar]) if params[:avatars]
      if @profile.update(profile_params)
        format.html { redirect_to user_profile_path, notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :handle, :bio, :location, :avatar)
    end
end
