class RootController < ApplicationController
  def top
  	 @word = Word.find(Word.favorite_ids.sample)
  end

  def about
  end
end
