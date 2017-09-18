class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :sorted, -> { order(:name) }
  
  has_many :assigned_event
  has_many :events, :through => :assigned_event

  has_many :visitors
  
  has_many :associates, class_name: "User", foreign_key: "manager_id"
  belongs_to :manager, class_name: "User"
  
  
end
