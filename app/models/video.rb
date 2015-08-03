class Video < ActiveRecord::Base

  belongs_to :user
  belongs_to :project

  include AutoHtml

  auto_html_for :link do
    html_escape
    image
    youtube(:width => 500, :height => 350, :autoplay => false)
    vimeo(:width => 660, :height => 400, :autoplay => false)
    soundcloud(:width => 660, :height => 120, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end




end
