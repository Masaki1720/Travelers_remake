class Destination < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :spot_name, presence: true
  validates :spot_introduction, presence: true
  validates :image, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索条件分岐
  def self.search_for(content, method)
    if method == 'perfect'
      Destination.where(spot_name: content)
    elsif method == 'forward'
      Destination.where('spot_name LIKE ?', content+'%')
    elsif method == 'backward'
      Destination.where('spot_name LIKE ?', '%'+content)
    else
      Destination.where('spot_name LIKE ?', '%'+content+'%')
    end
  end
end

