class CreateTestPassages < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passages do |t|
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true

    end
  end
end
