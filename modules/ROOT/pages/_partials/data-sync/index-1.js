const express = require('express')
//Include our server libraries
const { VoyagerServer, gql } = require('@aerogear/voyager-server')

//Provide your graphql schema
const typeDefs = gql`
  type Query {
    hello: String
  }
`

//Create the resolvers for your schema
const resolvers = {
  Query: {
    hello: (obj, args, context, info) => {
      return `Hello world`
    }
  }
}

//Initialize the library with your Graphql information
const server = VoyagerServer({
  typeDefs,
  resolvers
})

//Connect the server to express
const app = express()
server.applyMiddleware({ app })

app.listen(4000, () =>
  console.log(`🚀 Server ready at http://localhost:4000/graphql`)
)
