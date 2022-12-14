class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :timer, numericality: { only_integer: true, greater_than: 0 }, presence: true

  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, ->(category_id) {
                        joins(:category)
                          .where(categories: { id: category_id })
                          .order(title: :desc)
                      }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def self.category_by_title(category_title)
    by_category(category_title).pluck(:title)
  end
end
