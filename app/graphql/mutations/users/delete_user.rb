class Mutations::Users::DeleteUser < GraphQL::Schema::Mutation

  null true

  argument :user_id, ID, required: true
  def resolve(user_id:)
    user_obj = User.find(user_id)
    user_obj&.destroy
    user_obj
  end
end