namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

use org.wasmcloud.examples.realworld#Profile
use org.wasmcloud.examples.realworld#UserInfo
use org.wasmcloud.examples.realworld#Article

use org.wasmcloud.examples.petclinic#Date

@mixin
structure UserInfo {
    userId: U64,
}

@wasmbus( actorReceive: true )
service Favorites {
  version: "0.1",
  operations: [CreateFavorite, DeleteFavorite]
}

structure CreateFavoriteRequest with [UserInfo] {
    slug: String,
}

operation CreateFavorite {
    input: CreateFavoriteRequest
    output: Article
}

structure DeleteFavoriteRequest with [UserInfo] {
    slug: String,
}

operation DeleteFavorite {
    input: DeleteFavoriteRequest
    output: Article
}