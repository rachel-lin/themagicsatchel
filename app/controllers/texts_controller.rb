class TextsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @text = Text.new
  end

        def create
      @project = Project.find(params[:project_id])
      @text = Text.new(text_params)
        if @text.save
          flash[:notice] = "Text was saved."
          redirect_to @project
        else 
          flash[:error] = "There was an error saving your text. Please try again."
          render :new
        end
      end

  def edit
  end

  private

  def text_params
    params.require(:text).permit(:title, :body, :author)
  end

end
