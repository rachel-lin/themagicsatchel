class Video < ActiveRecord::Base

  belongs_to :user
  belongs_to :project



  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*\z/i
before_create -> do
  uid = link.match(YT_LINK_FORMAT)
  self.uid = uid[2] if uid && uid[2]
 
  if self.uid.to_s.length != 11
    self.errors.add(:link, 'is invalid.')
    false
  elsif Video.where(uid: self.uid).any?
    self.errors.add(:link, 'is not unique.')
    false
  else
    get_additional_info
  end
end

validates :link, presence: true, format: YT_LINK_FORMAT


private
 
def get_additional_info
  begin
    client = YouTubeIt::OAuth2Client.new(dev_key: 'AI39si6YFdOoAO8FSkgaIHJABl45qqrTNWlwjQreitFlog4l8cZ0pSvHVBOvfVxtrkiblQCU1ph059lS7zoDJqFi-6PEqwHMkw')
    video = client.video_by(uid)
    self.title = video.title
    self.duration = video.duration

  end
end
 


end
