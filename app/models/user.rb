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
         
  validates :nickname, presence: true, uniqueness: true
  validates :sex_id, numericality: { other_than: 1 }
  validates :age_id, numericality: { other_than: 1 }

  has_many :reports, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :age

end
