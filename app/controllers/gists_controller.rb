class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:id])

    result = GistQuestionService.new(@test_passage.current_question).call
    flash_options = if result.success?
                      create_gist!(url: result.html_url)
                      { notice: t('.success', link: view_context.link_to(t('.gist_link'), result.html_url)) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def create_gist!(url:)
    current_user.gists.create!(url: url, question_id: @test_passage.current_question.id)
  end
end
