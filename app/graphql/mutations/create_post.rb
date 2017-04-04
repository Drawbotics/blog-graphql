Mutations::CreatePost = GraphQL::Relay::Mutation.define do
  
  name "createPost"
  input_field :title,      !types.String
  input_field :content,    !types.String
  # input_field :user_id,    !types.ID

  # return_field :user,    !types.User
  return_field :post,     ::Types::PostType
  return_field :errors,   types[types.String]
  return_field :success,  types.Boolean

  resolve -> (object, args, ctx) {
    post = Post.create(
      title:    args[:title],
      content:  args[:content],
      user:     ctx[:current_user]
    )
    {
      post:   post.valid? ? post : nil,
      errors: post.errors.full_messages,
      success: post.persisted?
    }
  }

  ##################################################

  # name "AddPost"
  # description "Create a new post"

  # input_field :user_id, !types.ID
  # input_field :body,    !types.String

  # return_field :post, ::Types::PostType
  # return_field :errors, types[types.String]
  # return_field :success, types.Boolean

  # resolve ->(_, input, _) do
  #   # I dont use input[:user_id] on purpose
  #   post = ::Post.new(body: input[:body])
  #   {
  #     post:   post.valid? ? post : nil,
  #     errors: post.errors.full_messages,
  #     success: post.persisted?
  #   }
  # end

end