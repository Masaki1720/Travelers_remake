class Destination < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :spot_name, presence: true
  validates :image, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :transportation, presence: true

  enum prefecture:{
     "---":0,
     Hokkaido:1,Aomori:2,Iwate:3,Miyagi:4,Akita:5,Yamagata:6,Fukushima:7,
     Ibaraki:8,Tochigi:9,Gunma:10,Saitama:11,Chiba:12,Tokyo:13,Kanagawa:14,
     Niigata:15,Toyama:16,Ishikawa:17,Fukui:18,Yamanashi:19,Nagano:20,
     Gifu:21,Shizuoka:22,Aichi:23,Mie:24,
     Shiga:25,Kyoto:26,Osaka:27,Hyogo:28,Nara:29,Wakayama:30,
     Tottori:31,Shimane:32,Okayama:33,Hiroshima:34,Yamaguchi:35,
     Tokushima:36,Kagawa:37,Ehime:38,Kochi:39,
     Fukuoka:40,Saga:41,Nagasaki:42,Kumamoto:43,Oita:44,Miyazaki:45,Kagoshima:46,
     Okinawa:47
   }

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

