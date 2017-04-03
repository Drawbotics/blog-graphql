GraphiQL::Rails.config.headers['Authorization'] = -> (context) { "Token #{context.cookies['_graphql_token']}" }

# GraphiQL::Rails.config.headers['Authorization'] = -> (context) {
#   "Token #{context.request.env['warden'].user.try(:token)}"
# }
