class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[update show destroy edit]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  protected

  def badge_params
    params.require(:badge).permit(:name, :image_url, :condition, :condition_parameter, :single)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
