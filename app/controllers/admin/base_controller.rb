class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"

  def add_to_recent_user(user)
    session[:recent_users] ||= []
    if session[:recent_users].any?{|email, id| id == user.id }
      session[:recent_users].delete_if {|email, id| id == user.id}
    elsif session[:recent_users].size > 10
      session[:recent_users].pop
    end
    session[:recent_users].unshift( [user.email, user.id] )
  end
end
