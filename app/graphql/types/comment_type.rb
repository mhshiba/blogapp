class Types::CommentType < Types::BaseObject
  description 'Comment type'

  field :id, ID, null: false
  field :user, Types::UserType, null: false
  field :post, Types::PostType, null: false
  field :body, String, null: false

end