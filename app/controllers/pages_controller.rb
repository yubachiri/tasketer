class PagesController < ApplicationController
  # トップページにしたい
  def index
    @top_page = true
  end
end
