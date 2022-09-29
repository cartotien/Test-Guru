module TestPassageHelper
  def test_passage_result_header(test_passage)
    if test_passage.successful?
      "<h2 class='success'>You passed!</h2>".html_safe
    else
      "<h2 class='failure'>You failed.</h2>".html_safe
    end
  end
end
