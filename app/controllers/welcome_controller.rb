class WelcomeController < ApplicationController
	skip_before_filter :check_for_user
  def index
  end
end
