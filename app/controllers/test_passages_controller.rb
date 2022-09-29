class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[result show update]

  def result
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

  protected

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end