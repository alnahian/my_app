class Customer < ActiveRecord::Base
  attr_accessible :age, :description, :image_url, :location, :name
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
