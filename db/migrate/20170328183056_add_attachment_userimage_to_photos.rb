class AddAttachmentUserimageToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :userimage
    end
  end

  def self.down
    remove_attachment :photos, :userimage
  end
end
