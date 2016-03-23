class AddAttachmentImageToPortraits < ActiveRecord::Migration
  def self.up
    change_table :portraits do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :portraits, :image
  end
end
