resource "kubernetes_namespace" "staging" {
  metadata {
    name = var.namespace_name
  }
}

resource "google_compute_address" "df" {
  name   = var.address_name
  region = var.region
}

resource "kubernetes_service" "nginx" {
  metadata {
    namespace = kubernetes_namespace.staging.metadata[0].name
    name      = var.service_name
  }

  spec {
    selector = {
      run = "nginx"
    }

    session_affinity = "ClientIP"

    port {
      protocol    = "TCP"
      port        = 8080
      target_port = 8080
    }

    type             = "LoadBalancer"
    load_balancer_ip = google_compute_address.df.address
  }
}

resource "kubernetes_replication_controller" "nginx" {
  metadata {
    name      = var.controller_name
   namespace = kubernetes_namespace.staging.metadata[0].name

    labels = {
      run = "nginx"
    }
  }

  spec {
    selector = {
      run = "nginx"
    }

    template {
      metadata {
          name = "nginx"
          labels = {
              run = "nginx"
          }
      }

      spec {
        container {
            image = "jenkins/jenkins:lts-jdk11"
            name  = "nginx"

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
