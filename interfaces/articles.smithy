namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

use org.wasmcloud.examples.realworld#Profile

@wasmbus( actorReceive: true )
service Articles {
  version: "0.1",
  operations: [GetFeed, CreateArticle, GetArticles, GetArticle, UpdateArticle, DeleteArticle]
}

structure GetFeedRequest with [UserInfo] {
    @required
    limit: U64,
    @required
    offset: U64
}

structure MultipleArticlesResponse {
    articles: [Article],
    articlesCount: U64
}

structure Article {
    @required
    author: Profile,
    @required
    body: String,
    @required
    createdAt: Timestamp,
    @required
    description: String,
    @required
    favorited: Boolean,
    @required
    favoritesCount: U64,
    @required
    slug: String,
    @required
    tagList: [String],
    @required
    title: String,
    @required
    updatedAt: Timestamp
}

structure GetArticlesRequest {
    tag: String,
    author: String,
    favorited: String,
    @required
    limit: U64,
    @required
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
    @required
    body: String,
    @required
    description: String,
    @required
    title: String,
    tagList: [String]
}

operation CreateArticle {
    input: NewArticleRequest
    output: Article
}

structure GetArticleRequest {
    @required
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
    body: String,
    description: String,
    title: String,
}

operation UpdateArticle {
    input: UpdateArticleRequest
    output: Article
}

structure DeleteArticleRequest with [UserInfo] {
    @required
    slug: String
}

operation DeleteArticle {
    input: DeleteArticleRequest
    output: Boolean
}
