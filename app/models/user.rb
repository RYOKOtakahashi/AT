class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def email_required?
    false
  end

  def email_changed?
    false
  end
  # email_required?とemail_changed?をオーバーライドし、falseを返却するようにしておく。これをしないと、登録時にemailが必須になる。
end
