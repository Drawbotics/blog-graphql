Types::Inputs::CommentInputType = GraphQL::InputObjectType.define do
  name "CommentInputType"
  description "Properties for creating a comment"

  argument :content, !types.String do
    description "Content of the comment."
  end

end