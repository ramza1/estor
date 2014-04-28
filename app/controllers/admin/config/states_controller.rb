class Admin::Config::StatesController < ApplicationController
  def destroy
    @state = State.find(params[:id])
    if @state.active?
      @state.active = false
    else
      @state.active = true
    end
    @state.save
    redirect_to admin_config_country_url(@state.country)
  end
end
