namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

use org.wasmcloud.examples.realworld#Profile

use org.wasmcloud.examples.petclinic#Date

@wasmbus( actorReceive: true )
service Articles {
  version: "0.1",
  operations: [GetFeed, CreateArticle, GetArticles, GetArticle, UpdateArticle, DeleteArticle]
}

structure GetFeedRequest with [UserInfo] {
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

structure GetArticlesRequest {
    tag: String?,
    author: String?,
    favorited: String?,
    limit: U64,
    offset: U64
}

operation GetArticles {
    input: GetArticlesRequest,
    output: MultipleArticlesResponse
}

operation GetFeed {
    input: GetFeedRequest
    output: MultipleArticlesResponse
}

structure NewArticleRequest with [UserInfo] {
    article: NewArticle
}

structure NewArticle {
    body: String,
    description: String,
    title: String,
    tagList: [String]
}

operation CreateArticle {
    input: NewArticleRequest
    output: Article
}

structure GetArticleRequest {
    slug: String
}

operation GetArticle {
    input: GetArticleRequest
    output: Article
}

structure UpdateArticleRequest with [UserInfo] {
    slug: String,
    article: UpdateArticle,
}

structure UpdateArticle {
    body: String?,
    description: String?,
    title: String?,
}

operation UpdateArticle {
    input: UpdateArticleRequest
    output: Article
}

structure DeleteArticleRequest with [UserInfo] {
    slug: String
}

operation DeleteArticle {
    input: DeleteArticleRequest
    output: Boolean
}
