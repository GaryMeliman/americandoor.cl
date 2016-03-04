class Product < ActiveRecord::Base
  belongs_to :admin
  belongs_to :category
  mount_uploader :cover, CoverUploader
  validates :name, :presence => true, :uniqueness => {
  	:case_sensitive => false
  }
  validates :description, :presence => true
  validates :cover, :presence => true
  validates :price, :presence => true
end
