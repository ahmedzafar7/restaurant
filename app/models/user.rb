class User < ActiveRecord::Base
	after_destroy :ensure_one_waiter_remains
	validates :name, presence: true
  has_secure_password

  private
  	def ensure_one_waiter_remains
  		if User.count.zero?
  			raise "Cannot delete the only waiter account remaining"
  		end
  	end
end
