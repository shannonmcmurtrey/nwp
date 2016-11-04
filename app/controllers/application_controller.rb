class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  before_filter :authenticate_user!
  protect_from_forgery with: :exception
end
