class TextsController < ApplicationController
  
  def index
      @texts = Text.paginate(page: params[:page], per_page: 10)
    authorize @texts
    @text = Text.new
  end

  def new
    @text = Text.new
    authorize @text
  end

        def create
      @text = Text.new(text_params)
        authorize @text
        if @text.save
          flash[:notice] = "Text was saved."
          redirect_to texts_path
        else 
          flash[:error] = "There was an error saving your text. Please try again."
          render :new
        end
      end

  def edit
  end

  private

  def text_params
    params.require(:text).permit(:title, :body, :source)
  end

end
