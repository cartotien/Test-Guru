class Feedback < ApplicationRecord
  belongs_to :user

  validates :body, :title, presence: true
end
