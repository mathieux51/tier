// extern crate futures;
extern crate rusoto_core;
extern crate rusoto_s3;

use std::default::Default;

// use futures::future::Future;
use rusoto_core::{Region, HttpClient};
use rusoto_s3::{S3, S3Client, ListObjectsRequest};
use rusoto_credential::{EnvironmentProvider};

fn main() {
    let s3 = S3Client::new_with(HttpClient::new().unwrap(), EnvironmentProvider::default(), Region::UsEast1);
    let mut list_request = ListObjectsRequest::default();
    list_request.bucket = String::from("object-store-1606648481");
    let list_object_output = s3.list_objects(list_request).sync().unwrap();
    println!("{:#?}", list_object_output.contents);
}
