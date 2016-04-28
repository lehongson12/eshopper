class Admin::ProductsController < ApplicationController
  #before_action :authenticate_user!
  before_action :admin_only
  layout 'admin_lte_2'
  def index
  end

  def show
  end

  def edit
  end

  private
  def admin_only
    redirect_to root_path unless current_user.try :admin?
  end
end
