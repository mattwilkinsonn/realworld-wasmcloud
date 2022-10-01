namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

use org.wasmcloud.examples.petclinic#Date

@wasmbus( actorReceive: true )
service Users {
  version: "0.1",
  operations: [GetUser]
}

structure User {
    id: U64,
    username: String,
    email: String,
    password: String,
    bio: String,
    image: String,
    createdAt: Date,
    updatedAt: Date
}

operation GetUser {
    input: U64,
    output: User
}

