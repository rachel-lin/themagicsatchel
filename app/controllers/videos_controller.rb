class VideosController < ApplicationController

  def index
    @videos = Video.order('created_at DESC')
    @video = Video.new
  end

  def new
    @video = Video.new
  end
    def create
      @video = current_user.videos.build(video_params)
      if @video.save
        flash[:success] = 'Video added!'
        redirect_to videos_path
      else
        render :new
      end
    end


  def edit
        @video = Video.find(params[:id])
        authorize @video
  end

    def update
      @video = Video.find(params[:id])
        authorize @video
      if @video.update_attributes(video_params)
        flash[:notice] = "Video was updated."
        redirect_to videos_path
      else 
        flash[:error] = "There was an error saving your changes. Please try again."
        render :edit
      end
    end

  def destroy
    @video = Video.find(params[:id])
 
     authorize @video
     if @video.destroy
       flash[:notice] = "The video was deleted successfully."
       redirect_to videos_path
     else
       flash[:error] = "There was an error deleting the video."
       render :show
     end
  end

  private

  def video_params
    params.require(:video).permit(:link, :project_id, :thoughts)
  end

end
