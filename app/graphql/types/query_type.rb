Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello #{ctx[:current_user].try(:email)}!"
    }
  end

  field :posts, types[::Types::PostType] do
    description "The last posts"
    argument :limit, types.Int, default_value: 20
    resolve ->(obj, args, ctx) {
      # Cap the number of posts at 30
      limit = [args[:limit], 30].min
      Post.includes(:user, :comments).limit(limit).order(created_at: :desc)
    }
  end

  field :post, ::Types::PostType do
    description "A post"
    argument :id, !types.ID
    resolve ->(obj, args, ctx) {
      Post.find(args[:id])
    }
  end


  field :node, GraphQL::Relay::Node.field
end
