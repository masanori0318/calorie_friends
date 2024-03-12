class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :do_something

  has_many :records, dependent: :destroy
  validates :name, presence: true

  private

  def do_something
    # コールバックで実行する処理を記述する
  end
end
