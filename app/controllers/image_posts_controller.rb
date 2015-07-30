class ImagePostsController < ApplicationController

 def index
      @image_posts = ImagePost.all
    authorize @image_posts
    @image_post = ImagePost.new
  end

  def new
    @image_post = ImagePost.new
    authorize @image_post
  end

        def create

      @image_post = current_user.image_posts.build(image_post_params)
        authorize @image_post
        if @image_post.save
          flash[:notice] = "Visual was saved."
          redirect_to image_posts_path
        else 
          flash[:error] = "There was an error saving your visual. Please try again."
          render :new
        end
      end

   def edit
        @image_post = ImagePost.find(params[:id])
        authorize @image_post
  end

  def update
      @image_post = ImagePost.find(params[:id])
        authorize @image_post
      if @image_post.update_attributes(image_post_params)
        flash[:notice] = "Visual was updated."
        redirect_to image_posts_path
      else 
        flash[:error] = "There was an error saving your changes. Please try again."
        render :edit
      end
    end

  def destroy
     @image_post = ImagePost.find(params[:id])
 
     authorize @image_post
     if @image_post.destroy
       flash[:notice] = "The visual was deleted successfully."
       redirect_to image_posts_path
     else
       flash[:error] = "There was an error deleting the visual."
       render :show
     end
   end

  private

  def image_post_params
    params.require(:image_post).permit(:image, :caption, :project_id)
  end


end
