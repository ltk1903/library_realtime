class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[librarian user]

  def admin?
    role == 'admin'
  end

  def librarian?
    role == 'librarian'
  end

  def user?
    role == 'user'
  end
end
