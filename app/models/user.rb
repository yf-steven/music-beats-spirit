class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # allow users to update their accounts without passwords
   def update_without_current_password(params, *options)
    params.delete(:current_password)
 
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
 
    result = update_attributes(params, *options)
    clean_up_passwords
    result
   end

   def liked_by?(report_id)
      self.likes.where(report_id: report_id).exists?
   end
         
  validates :nickname, presence: true, uniqueness: true
  

  has_many :reports, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  
end
