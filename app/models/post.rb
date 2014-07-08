class Post < ActiveRecord::Base
  attr_accessible :content, :title, :photo
  mount_uploader :photo, PhotoUploader

end
