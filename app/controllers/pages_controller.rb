class PagesController < ApplicationController
  def home
    @interested_user = InterestedUser.new
  end
end
