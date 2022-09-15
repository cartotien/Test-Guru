class Test < ApplicationRecord
  def self.by_category(category)
    self.joins('JOIN categories ON tests.category_id = categories.id')
        .where('categories.title LIKE ?', category)
        .order(title: :desc)
        .pluck(:title)
  end
end
