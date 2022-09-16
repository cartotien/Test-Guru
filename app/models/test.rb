class Test < ApplicationRecord
  def self.by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where('categories.title LIKE ?', category)
      .order(title: :desc)
      .pluck(:title)
  end

  has_and_belongs_to_many :users
end
