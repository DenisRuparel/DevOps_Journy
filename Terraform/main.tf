provider "docker" {
  
}

resource "local_file" "denis" {
    filename = "./denis.txt"
    content  = "Hello, Denis!"
}

resource "docker_image" "nginx-img" {
    name         = "nginx:latest"
    keep_locally = false
}

resource "docker_container" "nginx-ctr" {
    name  = "nginx-container"
    image = docker_image.nginx-img.name
    ports {
        internal = 80
        external = 80
    }
}