class Item < ActiveRecord::Base

  searchable do
    text :title, :text, :sn, :brand, :scale, :dateval, :sellprice, :selldate
  end


  validates :title, presence: true,
                    length: { minimum: 5 }

  has_attached_file :trainimage,
            :styles => { :original => "780x600", :medium => "390x300>", :thumb => "130x100>" },
            :default_url => ':default_image_url'
  validates_attachment_content_type :trainimage, :content_type => /\Aimage\/.*\Z/

end
