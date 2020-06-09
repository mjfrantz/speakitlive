class TimeTrial < ApplicationRecord
  mount_uploader :audio, AudioUploader
  belongs_to :lesson
  has_many :mistakes, dependent: :destroy
  belongs_to :attendance_a, class_name: 'Attendance', foreign_key: :attendance_a_id
  belongs_to :attendance_b, class_name: 'Attendance', foreign_key: :attendance_b_id

  def broadcast_recording_start
    ActionCable.server.broadcast("time_trial_#{id}", recording_started: true)
  end

  def broadcast_recording_stop
    ActionCable.server.broadcast("time_trial_#{id}", recording_stopped: true)
  end

  def broadcast_recording_upload
    self.reload
    ActionCable.server.broadcast("time_trial_#{id}", recording_finished: true, audio_url: audio.url)
  end

  def broadcast_recording_restart
    ActionCable.server.broadcast("time_trial_#{id}", recording_restarted: true)
  end
end
