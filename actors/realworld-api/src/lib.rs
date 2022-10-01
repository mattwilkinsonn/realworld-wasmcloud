use wasmbus_rpc::actor::prelude::*;
use wasmcloud_interface_httpserver::{HttpRequest, HttpResponse, HttpServer, HttpServerReceiver};
use wasmcloud_interface_logging::{debug, error, info, warn};

#[derive(Debug, Default, Actor, HealthResponder)]
#[services(Actor, HttpServer)]
struct RealworldApiActor {}

/// Implementation of HttpServer trait methods
#[async_trait]
impl HttpServer for RealworldApiActor {
    /// Returns a greeting, "Hello World", in the response body.
    /// If the request contains a query parameter 'name=NAME', the
    /// response is changed to "Hello NAME"
    async fn handle_request(
        &self,
        _ctx: &Context,
        req: &HttpRequest,
    ) -> std::result::Result<HttpResponse, RpcError> {
        debug!("API request: {:?}", req);

        let path = &req.path[1..req.path.len()];
        let segments: Vec<&str> = path.trim_end_matches('/').split('/').collect();
        debug!("Segments: {:?}", segments);
        match (req.method.as_ref(), segments.as_slice()) {
            ("GET", ["user"]) => Ok(unexpected_error()),
            ("PUT", ["user"]) => Ok(unexpected_error()),
            ("GET", ["profiles", username]) => Ok(unexpected_error()),
            ("POST", ["profiles", username, "follow"]) => Ok(unexpected_error()),
            ("DELETE", ["profiles", username, "follow"]) => Ok(unexpected_error()),
            ("GET", ["articles"]) => Ok(unexpected_error()),
            ("GET", ["articles", "feed"]) => Ok(unexpected_error()),
            ("GET", ["articles", slug]) => Ok(unexpected_error()),
            ("POST", ["articles"]) => Ok(unexpected_error()),
            ("PUT", ["articles", slug]) => Ok(unexpected_error()),
            ("DELETE", ["articles", slug]) => Ok(unexpected_error()),
            ("POST", ["articles", slug, "comments"]) => Ok(unexpected_error()),
            ("GET", ["articles", slug, "comments"]) => Ok(unexpected_error()),
            ("DELETE", ["articles", slug, "comments", id]) => Ok(unexpected_error()),
            ("POST", ["articles", slug, "favorite"]) => Ok(unexpected_error()),
            ("DELETE", ["articles", slug, "favorite"]) => Ok(unexpected_error()),
            ("GET", ["tags"]) => Ok(unexpected_error()),
            (_, _) => Ok(HttpResponse::not_found()),
        }
    }
}

fn unexpected_error() -> HttpResponse {
    HttpResponse {
        status_code: 422,
        ..Default::default()
    }
}
