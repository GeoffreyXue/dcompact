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
3. Introducing S3 Fuse with Rocks DB, figure out that integration

Post steps not mentioned:
- Learn more C++
- Setting up another node for compaction
- Communicating between two RocksDB nodes


### 1. Getting started with dev-container with all necessary dependencies

Installation fill follow the Ubuntu installation, following https://github.com/facebook/rocksdb/blob/main/INSTALL.md to create a dev container that satisfies all dependencies.


### 2. Building and running RocksDB itself using a example application wtihin the examples folder

Based on the installation instructions above, `make all` will compile the static library and al of the relevant tools.

From reading http://rocksdb.blogspot.com/2013/11/the-history-of-rocksdb.html, it mentions that many different things are pluggable, in the sense that it can be built on top of RocksDB. It may be interesting to implement this for compaction/sstable format in the future.

### 3. Introducing S3 Fuse with Rocks DB, figure out that integration

Blindly following https://linuxbeast.com/tutorials/aws/install-s3fs-and-mount-s3-bucket-on-ubuntu-18-04/ and https://linuxbeast.com/aws-operations/how-to-install-s3fs-and-mount-an-s3-bucket-on-ubuntu-20-04/ for now

```
sudo apt-get install automake autotools-dev fuse g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config
```