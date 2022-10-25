class AddTimestampsToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_timestamps :test_passages, default: Time.zone.now
    change_column_default :test_passages, :created_at, nil
    change_column_default :test_passages, :updated_at, nil
  end
end
