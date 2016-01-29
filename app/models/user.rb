class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  after_destroy :ensure_one_waiter_remains
  validates :firstname, presence: true
  validates :email, presence: true, uniqueness:true
  validates :lastname, presence: true
  has_many :orders, dependent: :destroy

  
  private
  def ensure_one_waiter_remains
    if User.count.zero?
     raise "Cannot delete the only waiter account remaining"
   end
  end

end
