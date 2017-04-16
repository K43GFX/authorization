class Lab
  include Mongoid::Document
  resourcify
  has_many :instances
  belongs_to :user

  field :title, type: String
  field :text, type: String
end
