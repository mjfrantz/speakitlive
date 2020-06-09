class TimeTrialsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "time_trial_#{params[:time_trial_id]}"
  end
end
