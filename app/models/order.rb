class Order < ActiveRecord::Base

  attr_accessible :address, :name, :paid_amount, :previous_due, :published_at, :due_amount
  has_many :line_items, :dependent => :destroy
  validates :name, :address,:presence => true
  
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
  
  def add_line_items_from_cart(cart)
	cart.line_items.each do |item|
		item.cart_id = nil
		line_items << item
	end
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
  def current_due
	if paid_amount
		if previous_due
			total_price + previous_due - paid_amount
		else
			total_price - paid_amount
		end
	else
		if previous_due
			total_price + previous_due
		else
			total_price
		end
	end
  end
end
