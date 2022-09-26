module QuestionsHelper
  VIEW_NAME = { :new => '<h1>Create New Question</h1>', :edit => '<h1>Update Question</h1>' }.freeze

  def question_header(view)
    VIEW_NAME[view].html_safe
  end
end
