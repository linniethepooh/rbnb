class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: :home
skip_after_action :verify_authorized

  def home
    @parking_space = ParkingSpace.new
  end

  def dashboard

  end
end
