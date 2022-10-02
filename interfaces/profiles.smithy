namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

use org.wasmcloud.examples.petclinic#Date

@wasmbus( actorReceive: true )
service Profiles {
  version: "0.1",
  operations: [GetProfile, FollowUser, UnfollowUser]
}

@mixin
structure ProfileInput {
    currentUserId: U64,
    username: String
}

structure GetProfileInput with [ProfileInput] {}

structure Profile {
    username: String,
    bio: String,
    image: String,
    following: Boolean
}

operation GetProfile {
    input: GetProfileInput,
    output: Profile
}

structure FollowUserInput with [ProfileInput] {}

operation FollowUser {
    input: FollowUserInput,
    output: Profile
}

structure UnfollowUserInput with [ProfileInput] {}

operation UnfollowUser {
    input: UnfollowUserInput,
    output: Profile
}