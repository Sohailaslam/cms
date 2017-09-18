class AdminPanelController < ApplicationController
  before_action :authenticate_user!
  def index
    if user_signed_in? and current_user.has_role? :admin
      @users = User.with_any_role('manager')
    elsif user_signed_in? and current_user.has_role? :manager
      @users = current_user.associates
    elsif  user_signed_in? and current_user.has_role? :associate
      # @users = User.all
      redirect_to events_path
    # else
    #   @users = User.all
    end
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
  
  def assign_events
    @user = User.find(params[:user_id])
    @events = Event.all.map(&:name)
    
  end
  def assign_events_new
    params[:events].each do |event|
      
      AssignedEvent.create(user_id: params[:user_id],event_id: Event.find_by(name: event).id)
    end
    redirect_to '/admin_panel',notice: "Event successfully Assigned"
  end
end
