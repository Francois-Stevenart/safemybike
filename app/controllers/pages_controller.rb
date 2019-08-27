class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: []

  def landing
  end

  def how_it_works
  end
end
