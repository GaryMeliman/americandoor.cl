class Product < ActiveRecord::Base
  belongs_to :admin
  belongs_to :category
  mount_uploader :cover, CoverUploader
end
