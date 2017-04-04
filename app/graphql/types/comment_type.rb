Types::CommentType = GraphQL::ObjectType.define do
  name "Comment"
  description "A comment to a post"
  
  field :user,    ::Types::UserType
  field :post,    ::Types::PostType
  field :content, !types.String
  
end