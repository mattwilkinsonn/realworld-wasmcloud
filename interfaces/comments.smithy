namespace org.wasmcloud.examples.realworld

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64
use org.wasmcloud.model#u64

use org.wasmcloud.examples.realworld#Profile
use org.wasmcloud.examples.realworld#UserInfo

use org.wasmcloud.examples.petclinic#Date

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
    id: U64,
    author: Profile,
    body: String,
    createdAt: Date,
    updatedAt: Date

}

operation GetComments {
    input: GetCommentsRequest,
    output: MultipleCommentsResponse
}

structure NewCommentRequest with [UserInfo] {
    slug: String,
    comment: NewComment
}

structure NewComment {
    body: String
}

operation CreateComment {
    input: NewCommentRequest,
    output: Comment
}

structure DeleteCommentRequest with [UserInfo] {
    slug: String,
    id: U64
}

operation DeleteComment {
    input: DeleteCommentRequest,
    output: Boolean
}


