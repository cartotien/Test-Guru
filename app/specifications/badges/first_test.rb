module Badges
  class FirstTest < AbstractConditionSpecification
    def satisfied?
      @user.test_passages.count == 1
    end
  end
end
