class MistakesController < ApplicationController

  def create
    @mistake = Mistake.new(mistake_params)
    @time_trial = @mistake.time_trial
    @mistake.seconds = (Time.now - @time_trial.started_at).round(2)
    @mistake.save
    render 'create.js.erb'
  end

  private

  def mistake_params
    params.require(:mistake).permit(:category, :time_trial_id, :seconds)
  end
end
