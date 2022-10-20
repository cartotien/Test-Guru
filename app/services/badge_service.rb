class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.find_each do |badge|
      add_badge!(badge) if public_send(:"#{badge.condition}?", *badge.condition_parameter)
    end
  end

  def first_test?
    @user.test_passages.count == 1
  end

  def all_tests_in_category?(category)
    return unless @test_passage.test.category.title == category

    @user.test_passages.correct_tests_within_category(category).pluck('DISTINCT test_id').count == Test.by_category(category).count
  end

  def all_tests_with_level?(level)
    return unless @test_passage.test.level == level

    @user.test_passages.correct_tests_within_level(level.to_i).pluck('DISTINCT test_id').count == Test.by_level(level).count
  end

  private

  def add_badge!(badge)
    @user.badges << badge
  end
end
