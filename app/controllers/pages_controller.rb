class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @animals = policy_scope(Animal)
    skip_authorization
  end

  def about
    skip_authorization
  end
end
