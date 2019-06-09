class RootController < ApplicationController
  def top
  	@words = User.order("RAND()").limit(1)
  end

  def about
  end
end
