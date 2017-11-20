vcl 4.0;

backend cachewebsite1 {
  .host = "cache-website1";
  .port = "80";
}

backend cachewebsite2 {
  .host = "cache-website2";
  .port = "80";
}

sub vcl_recv {
    if (req.http.host == "cache-website1.yoursite.you") {
        set req.backend_hint = cachewebsite1;
    }

    if (req.http.host == "cache-website2.yoursite.you") {
        set req.backend_hint = cachewebsite2;
    }
}

sub vcl_backend_response {
 set beresp.ttl = 1m;
}

sub vcl_deliver {
    if (obj.hits > 0) {
            set resp.http.X-Cache = "HIT";
    } else {
            set resp.http.X-Cache = "MISS";
    }
}