class Types::PostType < Types::BaseObject
  description 'Post type'

  field :id, ID, null: false
  field :user, Types::UserType, null: false
  field :body, String, null: false

end