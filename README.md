# Token based authentication
To comply with the stateless API mode, we don't make use of cookies.

*But*, for `graphiql`, we do. `/giphy flip table`
To make a request through the UI at `/graphiql`, you have to setup a cookie named `_graphql_token` with as value the user's `token` which you want to impersonate.

You can do it like this in the chrome debug console:

````
document.cookie="_graphql_token=your_token_here"
````

# Mutations

````graphql
mutation createPost {
  createPost(input: {title: "This is a title", content: "Some content"}) {
    post {
      title
      content
      user {
        email
      }
    }
  }
}
````

That answers exactly what we expect from the request, which is why graphql is perfect for frontend - backend communication. *I get what I expect, nothing less, nothing more*.

````json
{
  "data": {
    "createPost": {
      "post": {
        "title": "This is a title",
        "content": "Some content",
        "user": {
          "email": "test@mail.com"
        }
      }
    }
  }
}
````