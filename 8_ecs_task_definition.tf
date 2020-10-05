
resource "aws_ecs_task_definition" "nginx_app" {
  family = var.task_definition["family"]
  container_definitions = <<DEFINITION
  [
    {
      "name": "${var.task_definition["name"]}",
      "image": "${var.task_definition["image_name"]}",
      "essential": ${var.task_definition["essential"]},
      "portMappings": [
        {
          "containerPort":8080,
          "hostPort":80
        }
      ],
      "memory": ${var.task_definition["memory"]},
      "environment": [
        {
          "name": "PORT",
          "value": "80"
        },
        {
        "name": "ecs_s3_bucket",
        "value": "${aws_s3_bucket.s3_ecs_bucket.bucket}"
      }
      ]
    }
  ]
DEFINITION
}
