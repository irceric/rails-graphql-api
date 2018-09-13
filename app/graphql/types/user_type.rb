Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :id, !types.ID
  field :email, !types.String
  field :firstName, !types.String
  field :lastName, !types.String
  field :interest, !types.String

end