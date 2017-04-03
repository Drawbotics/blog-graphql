Mutations::SignIn = GraphQL::Relay::Mutation.define do
  name "SignIn"
  input_field :email, !types.String
  input_field :password, !types.String

  return_field :token, types.String

  resolve -> (t, args, ctx) {
    @user = User.find_for_database_authentication(email: args[:email])
    token = if @user.valid_password?(args[:password])
      @user.token
    end
    { token: token }
  }
end