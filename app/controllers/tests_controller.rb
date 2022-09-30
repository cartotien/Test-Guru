class TestsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :current_user, only: %i[index show]
  before_action :find_test, only: %i[update edit show destroy start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def edit; end

  def new
    @test = Test.new
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def start
    @current_user.tests.push(@test)
    redirect_to @current_user.test_passage(@test)
  end

  protected

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:author_id, :title, :level, :category_id)
  end
end
