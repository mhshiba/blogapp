class Types::UserType < Types::BaseObject
  description 'User type'

  field :id, ID, null: false
  field :first_name, String, null: false
  field :last_name, String, null: false
  field :street, String, null: false
  field :city, String, null: false
  field :postcode, String, null: false
  field :country, String, null: false

  field :posts, [Types::PostType], null: true
  field :comments, [Types::CommentType], null: true

  field :full_address, String, null: false
end

class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name 'UserInputType'
  description 'All th attributes needed to create/update an user'

  argument :id, ID, required: false
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :street, String, required: false
  argument :city, String, required: false
  argument :postcode, String, required: false
  argument :country, String, required: false

end