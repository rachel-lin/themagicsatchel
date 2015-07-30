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

      @text = current_user.texts.build(text_params)
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
        @text = Text.find(params[:id])
        authorize @text
  end

  def update
      @text = Text.find(params[:id])
        authorize @text
      if @text.update_attributes(text_params)
        flash[:notice] = "Text was updated."
        redirect_to texts_path
      else 
        flash[:error] = "There was an error saving your changes. Please try again."
        render :edit
      end
    end

  def destroy
     @text = Text.find(params[:id])
 
     authorize @text
     if @text.destroy
       flash[:notice] = "\"#{@text.title}\" was deleted successfully."
       redirect_to texts_path
     else
       flash[:error] = "There was an error deleting the text."
       render :show
     end
   end

  private

  def text_params
    params.require(:text).permit(:title, :body, :source, :project_id)
  end

end
