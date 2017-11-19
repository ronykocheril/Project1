class AboutController < ApplicationController
  def index
    @about = About.all
  end

  def contact
    @contact = About.where("name = ?", "Contact")
  end
end
