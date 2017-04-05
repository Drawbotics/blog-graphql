Mutations::CreatePost = GraphQL::Relay::Mutation.define do
  
  name "createPost"

  input_field :title,           !types.String
  input_field :content,         !types.String
  input_field :category_ids,    types[types.ID]
  input_field :comments,        types[::Types::Inputs::CommentInputType]

  return_field :post,     ::Types::PostType
  return_field :errors,   types[types.String]
  return_field :success,  types.Boolean

  resolve -> (object, args, ctx) {
    user = ctx[:current_user]

    comments_attributes = []
    args[:comments].each do |comment| 
      comments_attributes << { user: user, content: comment[:content] }
    end

    post_attributes = {
      title:                args[:title],
      content:              args[:content],
      category_ids:         args[:category_ids],
      comments_attributes:  comments_attributes,
      user:                 user,
    }
    post = Post.create(post_attributes)

    # post.comments << Comment.create(user: user, content: )
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