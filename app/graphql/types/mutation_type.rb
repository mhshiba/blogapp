module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :create_user, Types::UserType, mutation: Mutations::Users::CreateUser

    field :update_user, Types::UserType, mutation: Mutations::Users::UpdateUser

    field :delete_user, Types::UserType, mutation: Mutations::Users::DeleteUser
  end
end
