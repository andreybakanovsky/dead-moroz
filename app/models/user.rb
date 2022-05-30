class User < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mapping do
    indexes :name
    indexes :email
  end

  has_many :goods, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :karma, dependent: :destroy

  after_create :create_default_karma

  validates :role, presence: true
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :age, presence: true

  enum role: { kid: 0, elf: 1, dead_moroz: 2 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def create_default_karma
    create_karma if role == 'elf'
  end
end
