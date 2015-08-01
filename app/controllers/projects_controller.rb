class ProjectsController < ApplicationController
  def index
    @projects = Project.paginate(page: params[:page], per_page: 10)
    @project = Project.new
    @text = Text.new
    @image_post = ImagePost.new
    @video = Video.new
    authorize @projects
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
    authorize @project
    @texts = @project.texts.includes(:user).paginate(page: params[:page], per_page: 10)
    @image_posts = @project.image_posts.includes(:user).paginate(page: params[:page], per_page: 10)


  end

  def edit
        @project = Project.find(params[:id])
        authorize @project
  end

    def update
      @project = Project.find(params[:id])
        authorize @project
      if @project.update_attributes(project_params)
        flash[:notice] = "Project details were updated."
        redirect_to projects_path
      else 
        flash[:error] = "There was an error saving your changes. Please try again."
        render :edit
      end
    end

  def destroy
     @project = Project.find(params[:id])
 
     authorize @project
     if @project.destroy
       flash[:notice] = "\"#{@project.name}\" was deleted successfully."
       redirect_to projects_path
     else
       flash[:error] = "There was an error deleting the project."
       render :show
     end
   end




end

  private

  def project_params
    params.require(:project).permit(:name, :public, :status)
  end