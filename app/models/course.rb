class Course < ApplicationRecord
  belongs_to :teacher
  has_many :lessons, dependent: :destroy
  has_many :students
  validates :name, presence: true
  validates :name, uniqueness: true
  # has_many :attendances, through: :lessons
end
