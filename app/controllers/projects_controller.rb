class ProjectsController < ApplicationController
  def index
    @projects = Project.paginate(page: params[:page], per_page: 10)
    @project = Project.new
    @text = Text.new
    @image_post = ImagePost.new
  end

        def create
      @project = Project.new(project_params)
        if @project.save
          flash[:notice] = "Project was saved."
          redirect_to projects_path
        else 
          flash[:error] = "There was an error saving your project. Please try again."
          render :new
        end
      end

  def show
    @project = Project.find(params[:id])
    @texts = @project.texts.includes(:user).paginate(page: params[:page], per_page: 10)

  end

  def edit
  end
end

  private

  def project_params
    params.require(:project).permit(:name, :public, :status)
  end