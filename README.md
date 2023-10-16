### Decompact
A repo for exploring the disaggregation of compaction for RocksDB. This repo should act as the client-side implementation of RocksDB.

### Setup

This project uses git submodules, since this repo is just intended to explore an unmodified version of rocksdb and s3fs.

Setting up the submodules requires a few preliminary steps.

```
git submodule init
git submodule update
```

> Also, you may have to set `git config core.filemode false` to prevent git from changing the executable permissions.

Then, open this up and start up a docker container with VS Code. You should be ready to go!


### Dockerfile

The Dockerfile follows https://github.com/facebook/rocksdb/blob/main/INSTALL.md to create a dev container that satisfies all dependencies.

The Dockerfile is copied from the build tools folder of the rocksdb project.

Some additional dependencies are added for s3fs-fuse.


### Steps

1. RocksDB Setup
2. AWS Setup
3. S3 Fuse Setup
4. S3 Fuse and RocksDB Integration  


## 1. RocksDB Setup

> From reading http://rocksdb.blogspot.com/2013/11/the-history-of-rocksdb.html, it mentions that many different things are pluggable, in the sense that it can be built on top of RocksDB. It may be interesting to implement this for compaction/sstable format in the future.

This will be just to get a static release version of rocksdb compiled and running along with a simple example running on top of it as well.

As a result, we just use the static library version of rocksdb for now

```
cd rocksdb
make static_lib
cd examples
make all
```

## 2. AWS Setup

This just requires setting up an IAM account + Bucket, along with credentials that have AmazonS3FullAccess.

> Note that this excludes the setting up compaction process still, ignoring that for now.

## 3. S3 Fuse Setup

Blindly following https://linuxbeast.com/tutorials/aws/install-s3fs-and-mount-s3-bucket-on-ubuntu-18-04/ and https://linuxbeast.com/aws-operations/how-to-install-s3fs-and-mount-an-s3-bucket-on-ubuntu-20-04/ for now.

```
cd s3fs-fuse
./autogen.sh
./configure
make
make install
mkdir /mnt/s3
```

Next, populate your secrets.

```
nano /etc/passwd-s3fs
chmod 600 /etc/passwd-s3fs
```

Finally, mount the S3 bucket.

```
s3fs <bucket name> /mnt/s3 -o passwd_file=/etc/passwd-s3fs
```

Creating new files within here should update the S3 bucket 

## 4. S3 Fuse and RocksDB Integration  

Modify the simple example in rocksdb to point to `/mnt/s3` as the base directory for the file system.

```

```

Run the program. It should generate some files that are uploaded to S3.