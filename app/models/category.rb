class Category < ActiveRecord::Base
	 resourcify
	has_many :foods
	validates :name, presence: true
  
end
