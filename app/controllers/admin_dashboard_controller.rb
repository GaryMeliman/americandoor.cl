class AdminDashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
    @products = Product.all
  end
end
