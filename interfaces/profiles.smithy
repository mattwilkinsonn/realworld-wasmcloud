namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

@wasmbus( actorReceive: true )
service Profiles {
  version: "0.1",
  operations: [GetProfile, FollowUser, UnfollowUser]
}

@mixin
structure ProfileInput {
    @required
    currentUserId: U64,
    @required
    username: String
}

structure GetProfileInput with [ProfileInput] {}

structure Profile {
    @required
    username: String,
    @required
    bio: String,
    @required
    image: String,
    @required
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