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
            ("GET", ["user"]) => Ok(HttpResponse::not_found()),
            (_, _) => Ok(HttpResponse::not_found()),
        }
    }
}
