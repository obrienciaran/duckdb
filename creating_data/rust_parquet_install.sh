# Install Rust and Cargo
curl https://sh.rustup.rs -sSf | sh
# Configure the shell
source $HOME/.cargo/env
# Install the open source Rust tool for converting csv to parquet
cargo install csv2parquet
