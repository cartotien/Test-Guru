module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create New Question for #{question.test.title}"
    else
      "Edit Question of #{question.test.title}"
    end
  end
end
