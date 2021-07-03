class User < ApplicationRecord
    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    has_many :microposts, dependent: :destroy

    has_one_attached :icon

    validates :icon,    content_type: { in: %w[image/jpeg image/gif image/png],
                            message: "must be a valid image format" },
                        size:         { less_than: 5.megabytes,
                            message: "should be less than 5MB" }


    has_many :likes
  
    # 渡された文字列のハッシュ値を返す
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  
    # ランダムなトークンを返す
    def User.new_token
      SecureRandom.urlsafe_base64
    end
  
    # 永続セッションのためにユーザーをデータベースに記憶する
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end
  
    # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    def feed
        Micropost.where("user_id = ?", id)
    end
  
    # ユーザーのログイン情報を破棄する
    def forget
      update_attribute(:remember_digest, nil)
    end

    #いいね？
    def liked_by?(micropost_id)
      likes.where(micropost_id: micropost_id).exists?
    end

    #icon リサイズ
    def display_icon
      icon.variant(resize_to_limit: [50, 50])
    end
end