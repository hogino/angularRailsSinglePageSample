class HomeController < ApplicationController

  def index
    @menu = I18n.t('controller.home.index.menu')
  end

  def nav_bar
    render layout: false
  end
end
