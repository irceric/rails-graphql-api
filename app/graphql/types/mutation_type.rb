module Types
  class MutationType < Types::BaseObject
    name "Mutation"

    field :createUser, function: Mutations::CreateUser.new
  end
end
