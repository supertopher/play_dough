class HomeController < ApplicationController
  def index
    @phases = Phase.all
  end

  def show
  end
  
  def new
  end

  def create
  end

end
