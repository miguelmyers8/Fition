class Photo < ApplicationRecord
  validates :userimage, presence: true
  validates :user_id, presence: true


  has_attached_file  :userimage,
  styles: {large: "640x640>", medium: "400x400#", thumb: "150x150#" }, :use_timestamp => false
  validates_attachment_content_type :userimage, content_type: /\Aimage\/.*\z/

  belongs_to :user
   has_many :comments, dependent: :destroy
end
