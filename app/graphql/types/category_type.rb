Types::CategoryType = GraphQL::ObjectType.define do
  name "Category"
  description "A category"
  
  field :name,    !types.String
  field :posts,   types[::Types::PostType]
  
end