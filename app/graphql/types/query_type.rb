module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :users, [Types::UserType], null: true,
      description: 'List all users'
    def users
      User.all
    end

    field :post, [Types::PostType], null: true,
      description: 'List all posts by user' do
        argument :user_id, Integer, required: true
      end
    def post(user_id:)
      Post.where(user_id: user_id)
    end

    field :comment, [Types::CommentType], null: true,
      description: 'List all comments by posts' do
  end
end
