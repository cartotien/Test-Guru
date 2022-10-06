class TestPassagesController < ApplicationController
  before_action :set_test_passage, except: :start

  def result; end

  def start
    @test = Test.find(params[:id])
  end

  def show
    @test = Test.find(@test_passage.test_id)
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    flash_options = if result.html_url.present?
                      create_gist!(url: result.html_url)
                      { notice: t('.success', link: result.html_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  protected

  def create_gist!(url:)
    current_user.gists.create!(url: url, question_id: @test_passage.current_question.id)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
