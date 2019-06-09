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
  end

  def index_pro
  end

  def index_ama
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
