### Overview 🧿

This is a shell script used to generate random data in .csv format. 

It generates three columns with fictitious data - Employee Number, Department, and Salary. For example to run this bash script for generating 1,000,000 rows of data, run the following:

`bash generate_data.sh 1000000`

Reference [here](https://stackoverflow.com/questions/29253591/generate-large-csv-with-random-content-in-bash)

### csv to parquet
It is also possible to convert the generated data to parquet format using [this](https://github.com/domoritz/csv2parquet) open source tool created in Rust. 

To do so, follow these steps:

1. Install Rust and Cargo. The easiest way to get Cargo is to install the current stable release of Rust by using rustup. Installing Rust using rustup will also install cargo. For MacOS: 
```
curl https://sh.rustup.rs -sSf | sh
```

2. Configure the current shell:
```
source $HOME/.cargo/env
```

3. Install the csv2parquet tool
```
cargo install csv2parquet
```

4. Convert the csv file to parquet 
```
csv2parquet data.csv data.parquet
```
