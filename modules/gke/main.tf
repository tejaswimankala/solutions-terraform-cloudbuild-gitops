# resource "kubernetes_namespace" "name" {
#   metadata {
#     name = var.namespace_name
#   }
# }

resource "google_compute_address" "df-1" {
  name   = var.address_name
  region = var.region
}



resource "kubernetes_service" "jenkins" {
  metadata {
   //namespace = kubernetes_namespace.name.metadata[0].name
    name      = var.service_name
  }

  spec {
    selector = {
      run = "jenkins"
    }

    session_affinity = "ClientIP"

    port {
      protocol    = "TCP"
      port        = 8080
      target_port = 8080
    }

    type             = "LoadBalancer"
    load_balancer_ip = google_compute_address.df-1.address
  }
}

resource "kubernetes_replication_controller" "jenkins" {
  metadata {
    name      = var.controller_name
  // namespace = kubernetes_namespace.name.metadata[0].name

    labels = {
      run = "jenkins"
    }
  }

  spec {
    selector = {
      run = "jenkins"
    }

    template {
      metadata {
          name = "jenkins"
          labels = {
              run = "jenkins"
          }
      }

      spec {
        container {
            image = "jenkins/jenkins:lts-jdk11"
            name  = "jenkins"

            # resources {
            #     limits {
            #         cpu    = "0.5"
            #         memory = "512Mi"
            #     }

            #     requests {
            #         cpu    = "250m"
            #         memory = "50Mi"
            #    }
            # }
        }       
      }
    }
  }
}

