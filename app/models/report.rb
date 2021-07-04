class Report < ApplicationRecord
  
  with_options presence: true do
    validates :title
    validates :text
    validates :violent, presence: { message: "の評価の項目を選んで下さい" }
    validates :with_family, presence: { message: "の評価の項目を選んで下さい" }
    validates :preparation, presence: { message: "の評価の項目を選んで下さい" }
  end

  belongs_to :user
  has_many :comments, :dependent => :destroy

end
