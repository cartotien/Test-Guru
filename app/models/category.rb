class Category < ApplicationRecord
  has_many :tests, polymorphic: true
end
