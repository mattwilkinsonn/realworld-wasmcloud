namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

use org.wasmcloud.examples.realworld#Profile

use org.wasmcloud.examples.petclinic#Date

@wasmbus( actorReceive: true )
service Articles {
  version: "0.1",
  operations: [GetFeed]
}

@mixin
structure UserInfo {
    userId: U64,
}

structure GetFeedInput with [UserInfo] {
    limit: U64,
    offset: U64
}

structure MultipleArticlesResponse {
    articles: [Article],
    articlesCount: U64
}

structure Article {
    author: Profile,
    body: String,
    createdAt: Date,
    description: String,
    favorited: Boolean,
    favoritesCount: U64,
    slug: String,
    tagList: [String],
    title: String,
    updatedAt: Date
}

operation GetFeed {
    input: GetFeedInput
    output: MultipleArticlesResponse
}