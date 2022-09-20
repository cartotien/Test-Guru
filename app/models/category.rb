class Category < ApplicationRecord
  validates :title, presence: true

  has_many :tests, dependent: :destroy

  default_scope { order(title: :asc) }
end
