class Admin::BaseController < ApplicationController
  before_action :authenticate_user!, :admin_required!

  layout 'admin'

  private

  def admin_required!
    redirect_to root_path, alert: "You're not authorized to view this page." unless current_user.is_a? Admin
  end
end
