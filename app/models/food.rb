class Food < ActiveRecord::Base
	 resourcify
	has_many :line_items
	has_many :orders, through: :line_items
	belongs_to :category

	before_destroy :ensure_not_referenced_by_any_line_item

	FOOD_TYPES = ["Starters", "Main Course", "Dessert", "Cold Drinks"]
	validates :category_id, presence: true
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image'
	}

	def self.order_by_title
		Food.order(:title)
	end

	private
	 #ensure there are no line items that reference this food item
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Food items present in Line Items')
        return false
      end
    end
end
