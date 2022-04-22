class Mutations::Users::UpdateUser < GraphQL::Schema::Mutation

  null true

  argument :user, Types::UserInputType, required: true
  def resolve(user:)
    user_obj = User.find(user[:id])

    user_obj&.update(user.to_h)
    user_obj
  end
end
