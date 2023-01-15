use std::fs::File;
use std::io::prelude::*;
use rand::Rng;

fn main() {
    let mut rng = rand::thread_rng();
    let mut file = File::create("/Users/user/Desktop/Work/rust/data.csv").unwrap();

    // create 1 million rows of data
    for i in 0..1_000_000 {
        let col1: i32 = rand::thread_rng().gen_range(0..100); // integer column. You need to access thread_rng() via rand:: directly to generate integers
        let col2: f64 = rand::thread_rng().gen(); // float column
        let col3: f64 = rand::thread_rng().gen();

        // output the rows as .csv
        let row = format!("{},{},{}\n", col1, col2, col3);
        file.write_all(row.as_bytes()).unwrap();
    }
}
