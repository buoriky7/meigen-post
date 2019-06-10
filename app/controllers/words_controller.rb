class WordsController < ApplicationController
  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
     if @word.save(word_params)
        redirect_to '/words'
        flash[:notice] = "successfully"
     else
        redirect_back(fallback_location: root_path)
    end
  end

  def index
    @words = Word.all

  end

  def index_pro
    @words = Word.all

  end

  def index_ama
    @words = Word.all

  end

  def show
  end

  def edit
  end

    private
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
