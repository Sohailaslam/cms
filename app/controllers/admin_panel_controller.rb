class AdminPanelController < ApplicationController
  def index
    @users = User.all.order(:name)
  end
  def add_users
    @user = User.new
  end
  def create_users
    if params[:password] != params[:password_confirmation]
      redirect_to '/admin_panel/add_users',notice: "Passwords don't match. Please try again"
    else
      if current_user.has_role? :admin
        User.create!(name: params[:name],email: params[:email],password: params[:password],designation: params[:designation],contact_number: params[:phone_number]).add_role :manager
        redirect_to '/admin_panel',notice: "Manager added successfully."
      elsif current_user.has_role? :manager
        User.create!(name: params[:name],email: params[:email],password: params[:password],designation: params[:designation],contact_number: params[:phone_number],manager_id: current_user.id).add_role :associate
        redirect_to '/admin_panel',notice: "Associate added successfully."  
      end
    end
  end
end
