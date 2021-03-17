resource "aws_ram_resource_share_accepter" "this" {
  share_arn = var.resource_share_arn

  # Leaving the share sometime takes a few seconds to propagate
  provisioner "local-exec" {
    command = "python -c 'import time; time.sleep(10)'"
    when    = destroy
  }
}
