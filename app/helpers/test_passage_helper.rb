module TestPassageHelper
  def test_passage_result_header(test_passage)
    if test_passage.correct_question_percentage >= 85
      render inline: "<h2 style='color:green;'>You passed!</h2>"
    else
      render inline: "<h2 style='color:red;'>You failed.</h2>"
    end
  end
end
