---
title: "Chapter 5 File I/O"
date: "2025-10-12T17:27:26+01:00"
categories: ["TLPI"]
tags: [c, rust, tlpi, linux]
layout: post
---

# File I/O

- All system calls are atomic in nature, all steps in that system call either complete or fail
- open takes a flag `O_EXCL` which means to create the file exclusively when it does not exists.Kernel guarantees that no other process will succed in creating file if this one fails.
- Similar things can happen while writing in files that support lseek. Two processes can overwrite data on each other.

## fcntl 
Signature
```
#include <fcntl.h>
int fnctl(int fd, int cmd, ...)

```
- one example is that of `GET_FL`  . This flag as 2nd arg fetches the FLAG that was used to open the file.
- In case one wants to access access bits ,AND with  O_ACCMODE . O_ACCMODE is 000000011 that means last two bits only represnt the access bits of read and write
- Kernel maintaisn 3 data structures
  - per process file descriptors
  - system wide table of open file descriptors
  - file system i-node table
- two processes can share file descriptor to same file and sometimes same offset, `dup` and `dup2` can also be used to share.
```
#include <unistd.h>
int dup(int old)
```
- `./myscript > results.log 2>&1` this would mean redirect both std output and error to log filr, 2 is stderr, 1 is stdout
- `newfd = fcntl(oldfd, F_DUPFD, startfd);` can also be used to duplicate fd

## pread
```
#include <unistd.h>
ssize_t pread(int fd, void *buf, size_t count, off_t offset);
Returns number of bytes read, 0 on EOF, or –1 on error
ssize_t pwrite(int fd, const void *buf, size_t count, off_t offset);
Returns number of bytes written, or –1 on error
```
The pread() and pwrite() system calls operate just like read() and write(), except that the file I/O is performed at the location specified by offset
This is performed atomically instead of at separatly

## readv and writev
```
#include <sys/uio.h>
ssize_t readv(int fd, const struct iovec *iov, int iovcnt);
Returns number of bytes read, 0 on EOF, or –1 on error
ssize_t writev(int fd, const struct iovec *iov, int iovcnt);
Returns number of bytes written, or –1 on error
```

- reads from different inuts and populates different buffers, all atomically
- `preadv` and `pwritev` performs reads and writes at different positions in buffer.

```
#include <unistd.h>
int truncate(const char *pathname, off_t length); int ftruncate(int fd, off_t length);

```
Nonblocking mode can be used with devices (e.g., terminals and pseudoterminals), pipes, FIFOs, and sockets. 
(Because file descriptors for pipes and sockets are not obtained using open(), we must enable this flag using the fcntl() F_SETFL operation described in Section 5.3.)
O_NONBLOCK is generally ignored for regular files, because the kernel buffer cache ensures that I/O on regular files does not block, as described in Section 13.1. 
How- ever, O_NONBLOCK does have an effect for regular files when mandatory file locking is employed (Section 55.4).

    
