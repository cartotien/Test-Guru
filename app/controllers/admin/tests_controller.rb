class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[update edit show destroy start update_inline]
  before_action :set_tests, only: %i[index update_inline]

  def index; end

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

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  protected

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :timer, :category_id)
  end
end
