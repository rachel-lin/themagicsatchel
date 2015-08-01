class VideosController < ApplicationController
  
  def index
    @videos = Video.order('created_at DESC')
  end

  def new
    @video = Video.new
  end
    def create
      @video = Video.new(video_params)
      if @video.save
        flash[:success] = 'Video added!'
        redirect_ to videos_path
      else
        render :new
      end
    end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def video_params
    params.require(:video).permit(:title, :duration, :link, :project_id)
  end

end
