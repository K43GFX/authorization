class Instance
  include Mongoid::Document
  resourcify
  belongs_to :user
  
  field :title, type: String
  field :text, type: String
end
