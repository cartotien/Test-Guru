class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[update edit show destroy start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def edit; end

  def new
    @test = current_user.authored_tests.build
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path(@test)
  end

  def create
    @test = current_user.authored_tests.build(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  protected

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:author_id, :title, :level, :category_id)
  end
end
