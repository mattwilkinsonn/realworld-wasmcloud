namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

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
    @required
    id: U64,
    @required
    username: String,
    @required
    email: String,
    @required
    bio: String,
    @required
    image: String,
    @required
    createdAt: Timestamp,
    @required
    updatedAt: Timestamp
}

operation GetCurrentUser {
    input: GetCurrentUserInput,
    output: UserResponse
}

structure UpdateCurrentUserRequest with [UserInfo] {
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
    @required
    email: String,
    @required
    password: String
}

structure LoginUserResponse with [UserResponse] {
    @required
    token: String
}

operation LoginUser {
    input: LoginUserRequest,
    output: LoginUserResponse
}

structure NewUserRequest {
    @required
    username: String,
    @required
    password: String,
    @required
    email: String,
    @required
    bio: String,
    @required
    image: String
}


operation RegisterUser {
    input: NewUserRequest,
    output: LoginUserResponse
}

@mixin
structure UserInfo {
    @required
    userId: U64,
}