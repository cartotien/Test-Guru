class TestsController < ApplicationController
  before_action :find_test, only: %i[update edit show destroy]
  before_action :new_test, only: %i[new]
  before_action :find_questions, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def edit
  end

  def new
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  def create
    @test = Test.create(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  protected

  def new_test
    @test = Test.new
  end

  def find_questions
    @questions = @test.questions
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
