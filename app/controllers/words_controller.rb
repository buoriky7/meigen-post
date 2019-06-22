class WordsController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
     if @word.save(word_params)
        redirect_to '/words'
        flash[:notice] = "OK"
     else
        flash[:notice] = "NG"
        redirect_back(fallback_location: root_path)
    end
  end

  def index
    @words = Word.page(params[:page]).reverse_order

  end


  def show
    @word = Word.find(params[:id])
    @favorite = @word.favorites.page(params[:page]).per(1).reverse_order
    @favorites = @word.favorites.all
  end

  def edit
    @word = Word.find(params[:id])
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to user_path(word.user.id)
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
       redirect_to word_path
       flash[:notice] = "OK"
    else
       flash[:notice] = "NG"
       render :edit
    end
  end



    private

    def correct_user
      word = Word.find(params[:id])
      if current_user.id == word.user.id
      else
        redirect_back(fallback_location: root_path)
      end
    end



    def word_params
     params.require(:word).permit(:speaker,
                                  :genre,
                                  :speaker_gender,
                                  :sp_word,
                                  :commentary,
                                  :image,
                                  :word_flag)
    end

end




