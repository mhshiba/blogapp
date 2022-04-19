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

    field :users, [Types::UserType], null: true, description: 'List all users' do
      argument :user_id, ID, required: false
    end
    def users(user_id: nil)
      query = User.all
      query = query.where(id: user_id) if user_id
      query
    end

    field :posts, [Types::PostType], null: true, description: 'List all posts by user' do
      argument :user_id, ID, required: false
    end
    def posts(user_id: nil)
      return Post.all unless user_id

      Post.where(user_id: user_id)
    end

    field :comments, [Types::CommentType], null: true, description: 'List all comments by posts' do
      argument :user_id, ID, required: false
      argument :post_id, ID, required: false
    end
    def comments(user_id: nil, post_id: nil)
      query = Comment.all
      query = query.where(user_id: user_id) if user_id
      query = query.where(post_id: post_id) if post_id
      query
    end

  end
end
