class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    work_spaces_path
  end
end
