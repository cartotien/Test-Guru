module TestPassageHelper
  def test_passage_result_header(test_passage)
    if test_passage.successful?
      "<h2 class='text-success'>#{t('you_passed')}</h2>".html_safe
    else
      "<h2 class='text-danger'>#{t('you_failed')}</h2>".html_safe
    end
  end
end
