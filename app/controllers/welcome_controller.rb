class WelcomeController < ApplicationController

  @layoutAction = "";

  def index
    @layoutAction = "home"
  end

  def about
    @layoutAction = "about"
  end

  def contact
    @layoutAction = "contact"
  end
end
