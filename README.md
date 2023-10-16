### Decompact
A repo for exploring the disaggregation of compaction for RocksDB.

1. Getting started with dev-container with all necessary dependencies
2. Building and running unit tests on Rocks DB itself
3. Building out a mini application that uses Rocks DB
4. Introducing S3 Fuse with Rocks DB, figure out that integration

Post steps not mentioned:
- Learn more C++
- Setting up another node for compaction
- Communicating between two RocksDB nodes


### 1. Getting started with dev-container with all necessary dependencies

Installation fill follow the Ubuntu installation, following https://github.com/facebook/rocksdb/blob/main/INSTALL.md to create a dev container that satisfies all dependencies.


### 2. Building and running unit tests on Rocks DB itself

Based on the installation instructions above, `make all` will compile the static library and al of the relevant tools.

### 3. Building out a mini application that uses Rocks DB
### 4. Introducing S3 Fuse with Rocks DB, figure out that integration