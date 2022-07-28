class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  before_create :greeting_messege

  def greeting_messege
    puts "wellcome to article "
  end

end
