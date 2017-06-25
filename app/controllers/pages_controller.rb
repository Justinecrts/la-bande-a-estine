class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :principle, :about]

  def home
  end

  def principle
  end

  def about
  end

end
