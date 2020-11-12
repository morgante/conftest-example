/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The project to create resources inside of."
  type = string
  default = null
}

locals {
  project = var.project_id
}

provider "google" {
  version = "~> 2.11.0"
  project = local.project
}

resource "random_id" "bucket" {
  byte_length = 8
}

resource "google_storage_bucket" "my-bucket" {
  name     = "my-bucket-${random_id.bucket.hex}"
  project  = local.project
  location = "US"
}

module "bucket" {
  path = "./modules/bucket"
  project_id = var.project_id
}