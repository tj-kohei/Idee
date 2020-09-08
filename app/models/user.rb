class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:login]

         has_one :profile
         has_many :ideas
         has_many :reviews
         before_create :build_default_profile

         validates :username,
         uniqueness: {case_sensitive: :false},
         length: {minimun: 4, maximum: 31},format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "ユーザー名は半角英数字です"}

         acts_as_paranoid
         def self.included(base)
          base.extend ClassMethods
          assert_validations_api!(base)

          base.class_eval do
            validates_presence_of   :email, if: :email_required?

            validates_format_of     :email, with: email_regexp, allow_blank: true, if: :email_changed?

      validates_presence_of     :password, if: :password_required?
      validates_confirmation_of :password, if: :password_required?
      validates_length_of       :password, within: password_length, allow_blank: true
    end
  end
 
  validates :email, uniqueness_without_deleted: true

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end


  def email_changed?
    false
  end


  private
  def build_default_profile
       build_profile
       true
  end
end
