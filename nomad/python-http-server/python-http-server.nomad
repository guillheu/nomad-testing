job "python-http-server" {
  datacenters = ["dc1"]

  group "http" {
    network {
      mode = "bridge"
      port "http" {
        to = 8080
        static = 80
      }
    }

    task "python" {
      driver = "docker"

      config {
        image          = "python:alpine"
        ports          = ["http"]
        args = [        # having the python container start an http server, serving files at local/www/ on port 8080
          "python3",
          "-m",
          "http.server",
          "8080",
          "--dir",
          "local/www/",
          "--bind",
          "0.0.0.0"
        ]
        auth_soft_fail = true
      }
      artifact {
        source      = "git::https://github.com/guillheu/nomad-testing"
        destination = "local/www"
      }


      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
