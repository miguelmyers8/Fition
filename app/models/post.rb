class Post < ApplicationRecord
  validates :image, presence: true
  validates :user_id, presence: true

  Paperclip.interpolates :caption do |attachment, style|
    attachment.instance.caption
  end

  has_attached_file  :image,
  styles: {large: "640x640>", medium: "300x300>", thumb: "150x150#" }, :use_timestamp => false
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

#:url => "/system/:attachment/:id/:style/:caption.:extension",
#:path => ":rails_root/public/system/:attachment/:id/:style/:caption.:extension",

belongs_to :user
end


#class Post < ApplicationRecord
#def self.fakename
#rang = rand(0.0...1.0).to_s
#rangdata = rang.gsub!(/[^0-9A-Za-z]/, '')
#end

  #validates :image, presence: true
  #has_attached_file  :image,
  #:path => ":rails_root/public/upload/:attachment/"+Post.fakename+ ".:extension",
  #styles: {large: "640x640>", medium: "300x300>", thumb: "150x150#" }, :use_timestamp => false
#validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
#end
