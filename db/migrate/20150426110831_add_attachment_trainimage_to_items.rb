class AddAttachmentTrainimageToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :trainimage
      add_column :items, :trainimage_fingerprint, :string
    end
  end

  def self.down
    remove_attachment :items, :trainimage
    remove_column :items, :trainimage_fingerprint
  end
end
