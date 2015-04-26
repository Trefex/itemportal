class Item < ActiveRecord::Base

  searchable do
    text :title, :text
  end


  validates :title, presence: true,
                    length: { minimum: 5 }

  has_attached_file :trainimage, :styles => { :original => "780x600", :medium => "390x300>", :thumb => "130x100>" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :trainimage, :content_type => /\Aimage\/.*\Z/

end
