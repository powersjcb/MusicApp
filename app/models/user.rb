class User < ActiveRecord::Base

  attr_reader :password

  validates :email, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  def find_by_credentials(email, password)
    @user = User.find_by(email: email)

      #user is not nil & user has valid pw
    if @user && @user.is_password?(password)
      @user
    else #not valid combo
      nil
    end
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  def is_password?(pw)
    BCrypt::Password.new(password_digest).is_password?(pw)
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def reset_session_token!
    self.session_token = generate_session_token
  end
end