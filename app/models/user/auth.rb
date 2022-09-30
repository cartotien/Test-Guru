module User::Auth
  attr_reader :password
  attr_writer :password_confirmation

  extend ActiveSupport::Concern

  included do
    validates :name, :email, presence: true, uniqueness: true
    validates_format_of :email, with: /\A[^@\s]+@[^@.\s]+(?:\.[^@.\s]+)*\z/
    validate :password, if: proc { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end

  def password=(string)
    if string.nil?
      self.password_digest = nil
    elsif string.present?
      @password = string
      self.password_digest = digest(string)
    end
  end

  def authenticate(password_string)
    digest(password_string) == password_digest ? self : false
  end

  protected

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
