Types::PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A post with a title and some content"
  # interfaces [ProductionInterface, DurationInterface]

  # field :runtimeMinutes, !types.Int, property: :runtime_minutes
  
  field :user,    ::Types::UserType
  field :title,   !types.String
  field :content, !types.String

  field :comments, types[::Types::CommentType] do
    argument :limit, types.Int
    resolve ->(object, args, ctx) {
      comments = object.comments
      args[:limit] && comments = comments.limit(args[:limit])
      comments
    }
   end
end