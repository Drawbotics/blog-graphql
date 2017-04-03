Mutations::Root = GraphQL::ObjectType.define do
  name "Mutation"

  field :SignIn, field: ::Mutations::SignIn.field
end