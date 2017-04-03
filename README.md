To make a request through the UI at `/graphiql`, you have to setup a cookie named `_graphql_token` with as value the user's `token` which you want to impersonate.

You can do it like this in the chrome debug console:

````
document.cookie="_graphql_token=your_token_here"
````