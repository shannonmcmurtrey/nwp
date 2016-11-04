class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_action :set_paper_trail_whodunnit, except: :create

  protect_from_forgery with: :exception


  def user_for_paper_trail
        return nil unless defined?(current_user)
        current_user && current_user.id
  end
end
