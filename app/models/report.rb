class Report < ApplicationRecord
  
  with_options presence: true do
    validates :title
    validates :artist
    validates :text
    validates :violent, presence: { message: "の評価は星0.5以上を選んでください" }
    validates :with_family, presence: { message: "の評価は星0.5以上を選んでください" }
    validates :preparation, presence: { message: "の評価は星0.5以上を選んでください" }
  end

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  
  scope :search, -> (search_params) do
    return if search_params.blank?

    title_like(search_params[:title])
    .artist_like(search_params[:artist])
    .text_like(search_params[:text])
    .recommend_like(search_params[:recommend])
  end

  scope :title_like, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? }
  scope :artist_like, -> (artist) { where('artist LIKE ?', "%#{artist}%") if artist.present? }
  scope :text_like, -> (text) { where('text LIKE ?', "%#{text}%") if text.present? }
  scope :recommend_like, -> (recommend) { where('recommend LIKE ?', "%#{recommend}%") if recommend.present? }
  
end
