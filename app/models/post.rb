class Post < ApplicationRecord

  acts_as_votable

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { medium: "700x500>", thumb: "250x150>", small:"160x160!>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
