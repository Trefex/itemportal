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

  # filterrific(
  #     default_filter_params: { sorted_by: 'created_at_desc' },
  #     available_filters: [
  #       :sorted_by,
  #       :search_query,
  #       :with_country_id,
  #       :with_created_at_gte
  #     ]
  #   )
  #
  #   # ActiveRecord association declarations
  #   belongs_to :country
  #
  #   # Scope definitions. We implement all Filterrific filters through ActiveRecord
  #   # scopes. In this example we omit the implementation of the scopes for brevity.
  #   # Please see 'Scope patterns' for scope implementation details.
  #   scope :search_query, lambda { |query|
  #     # Filters students whose name or email matches the query
  #     ...
  #   }

end
