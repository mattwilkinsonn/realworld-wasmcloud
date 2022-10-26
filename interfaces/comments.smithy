namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

use org.wasmcloud.examples.realworld#Profile
use org.wasmcloud.examples.realworld#UserInfo

@wasmbus( actorReceive: true )
service Comments {
  version: "0.1",
  operations: [GetComments, CreateComment, DeleteComment]
}

structure GetCommentsRequest {
    slug: String
}

structure MultipleCommentsResponse {
    comments: [Comment]
}

structure Comment {
    @required
    id: U64,
    @required
    author: Profile,
    @required
    body: String,
    @required
    createdAt: Timestamp,
    @required
    updatedAt: Timestamp

}

operation GetComments {
    input: GetCommentsRequest,
    output: MultipleCommentsResponse
}

structure NewCommentRequest with [UserInfo] {
    @required
    slug: String,
    @required
    comment: NewComment
}

structure NewComment {
    @required
    body: String
}

operation CreateComment {
    input: NewCommentRequest,
    output: Comment
}

structure DeleteCommentRequest with [UserInfo] {
    @required
    slug: String,
    @required
    id: U64
}

operation DeleteComment {
    input: DeleteCommentRequest,
    output: Boolean
}


