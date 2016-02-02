class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable
  after_destroy :ensure_one_admin_remains
  validates :firstname, presence: true
  validates :email, presence: true, uniqueness:true
  validates :lastname, presence: true
  has_many :orders, dependent: :destroy

  
  private
  def ensure_one_admin_remains
    if User.with_role(:admin).count.zero?
     raise "Cannot delete the only admin account remaining"
   end
  end

end
