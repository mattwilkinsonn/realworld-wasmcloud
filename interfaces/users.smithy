namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

use org.wasmcloud.examples.petclinic#Date

@wasmbus( actorReceive: true )
service Users {
  version: "0.1",
  operations: [GetCurrentUser, UpdateCurrentUser, LoginUser, RegisterUser]
}

structure GetCurrentUserInput {
    token: String
}

@mixin
structure UserResponse {
    id: U64,
    username: String,
    email: String,
    bio: String,
    image: String,
    createdAt: Date,
    updatedAt: Date
}

operation GetCurrentUser {
    input: GetCurrentUserInput,
    output: UserResponse
}

structure UpdateCurrentUserRequest {
    email: String,
    username: String,
    password: String,
    image: String,
    bio: String
}

operation UpdateCurrentUser {
    input: UpdateCurrentUserRequest,
    output: UserResponse
}

structure LoginUserRequest {
    email: String,
    password: String
}

structure LoginUserResponse with [UserResponse] {
    token: String
}

operation LoginUser {
    input: LoginUserRequest,
    output: LoginUserResponse
}

structure NewUserRequest {
    username: String,
    password: String,
    email: String,
    bio: String,
    image: String
}


operation RegisterUser {
    input: NewUserRequest,
    output: LoginUserResponse
}

@mixin
structure UserInfo {
    userId: U64,
}