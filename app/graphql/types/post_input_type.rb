PostInputType = GraphQL::InputObjectType.define do
  name "PostInputType"
  description "Properties for creating a Post"

  argument :content, !types.String do
    description "Description of the post."
  end

  argument :title, !types.String do
    description "Title of the post."
  end
end