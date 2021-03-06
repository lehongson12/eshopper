class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :admin_only
  #before_action :authenticate_user!

  layout 'admin_lte_2'
  def index
    respond_to do |format|
      format.html
      format.json { render json: Admin::CategoriesDatatable.new(view_context) }
    end
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find params[:id]
  end

  def create
    @category = Category.new category_params
    #@users = User.all
    if @category.save
      #UserNotificationService.new(@users).notify
      flash[:success] = t "category.create.success"
      redirect_to [:admin, :categories]
    else
      flash[:danger] = t "category.create.error"
      render :new
    end
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = t "category.update.success"
      redirect_to [:admin, :categories]
    else
      flash[:danger] = t "category.update.error"
      render :edit
    end
  end

  def destroy
    @category = Category.find params[:id]
    if @category.destroy
      flash[:success] = t "category.destroy.success"
      redirect_to [:admin, :categories]
    else
      flash[:danger] = t "category.destroy.error"
    end
  end

  private
  def admin_only
    redirect_to root_path unless current_user.try :admin?
  end

  def category_params
    params.require(:category).permit :name, :description
  end
end
