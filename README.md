### Decompact
A repo for exploring the disaggregation of compaction for RocksDB.

### Setup

This project uses git submodules, since this repo is just intended to explore an unmodified version of rocksdb.

You can set up the submodule via `git submodule init` and `git submodule update`.

> Also, you may have to set `git config core.filemode false` to prevent git from changing the executable permissions.

Then, open this up and start up a docker container with VS Code. You should be ready to go!


### Step by Step

1. Getting started with dev-container with all necessary dependencies
2. Building and running RocksDB itself using a example application wtihin the examples folder
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

From reading http://rocksdb.blogspot.com/2013/11/the-history-of-rocksdb.html, it mentions that many different things are pluggable, in the sense that it can be built on top of RocksDB. It may be interesting to implement this for compaction/sstable format in the future.



### 4. Introducing S3 Fuse with Rocks DB, figure out that integration