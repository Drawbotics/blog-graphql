Types::UserType = GraphQL::ObjectType.define do
  name "User"
  description "User type"

  field :password, !types.String
  field :email,    !types.String

end