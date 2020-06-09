class InterestedUsersController < ApplicationController
  def create
    @interested_user = InterestedUser.new(interested_user_params)
    if @interested_user.save
      redirect_to pages_thank_you_path
    else
      render :template => 'pages/home'
    end
  end

  def interested_user_params
    params.require(:interested_user).permit(:email)
  end
end
