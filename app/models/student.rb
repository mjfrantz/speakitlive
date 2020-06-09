class Student < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :student_number, presence: true
  has_many :attendances
  has_many :time_trials, through: :attendances
  has_many :homeworks

  def lesson_time_trials(lesson)
    attendances.map(&:time_trials).first.select { |tt| tt.lesson == lesson }
    # attendances.map(&:time_trials).flatten.select { |tt| tt.lesson == lesson }
  end
end

# attendances.map do |attendance|
#   attendance.time_trials
# end
