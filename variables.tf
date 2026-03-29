variable "s3-objects" {
  type = map(object({
    key          = string
    source       = string
    content_type = string
  }))

  description = "The different objects to upload to the bucket."

  default = {
    
    "Theos_Blessing" = {
      key          = "images/Theos_Blessing.png"
      source       = "./images/Theos_Blessing.png"
      content_type = "image/png"
    }
    "Webhook_Delivery" = {
      key          = "images/Webhook_Delivery.png"
      source       = "./images/Webhook_Delivery.png"
      content_type = "image/png"
    }
    "Jenkins_Pipeline1" = {
      key          = "images/Jenkins_Pipeline1.png"
      source       = "./images/Jenkins_Pipeline1.png"
      content_type = "image/png"
    }
    "Jenkins_Full_Pipeline" = {
      key          = "images/Jenkins_Full_Pipeline.png"
      source       = "./images/Jenkins_Full_Pipeline.png"
      content_type = "image/png"
    }
  }
}