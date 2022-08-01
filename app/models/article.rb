class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  before_create :greeting_messege
  after_validation :remove_whitespaces

  def greeting_messege
    puts "wellcome to article "
  end


  def remove_whitespaces
    title.strip!
  end
end
