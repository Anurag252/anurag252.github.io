---
title: "Chapter 4 File I/O"
date: "2025-08-28T08:03:26+01:00"
categories: ["TLPI"]
tags: [c, rust, tlpi, linux]
layout: post
---

# File I/O

- 6 types of files.
- 4 types of file syscall

  - open
  - read
  - write
  - close

- A program to copy a file

```C
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <sys/socket.h>

// __POSIX_C_SOURCE needed for *strtok, strcat


const int FILENAME_LIMIT = 100;
const int BUFFER_SIZE = 10;


int main(int argc, char *argv[]) {

   if (argc != 2) {
      printf("exactly one arguement expected\n");
      return 1;
   }
   char filename[FILENAME_LIMIT]; // support only 100 chars in filename
   strcpy(filename, argv[1]);
   int fd = open(filename, O_RDONLY);

   char* file = strtok(filename, ".");
   char* ext = strtok(NULL, ".");
   char copied_file_name[FILENAME_LIMIT];

   if (sizeof(ext) == 0) {
      // no extension in file
      strcat(copied_file_name, file);
      strcat(copied_file_name,  "_copy");


   } else {

      strcat(copied_file_name, file);
      strcat(copied_file_name,  "_copy");
      strcat(copied_file_name,  ".");
      strcat(copied_file_name,  ext);
   }




   int fd_cpy = open(copied_file_name, O_RDWR | O_CREAT, 0664 );


   if (fd == -1 || fd_cpy == -1) {
      perror("could not open file");
      return 1;
   }

   int buf[BUFFER_SIZE] ; // allocate this on stack so that freeing is not required
   int read_status = 0;
      while( (read_status = read(fd, buf, BUFFER_SIZE)) > 0) {
        int write_status =  write(fd_cpy, buf, read_status);
        if (write_status == -1) {
         perror("write");
        }
        memset(buf, '\0',BUFFER_SIZE);
      }
      if (read_status != 0) {
         perror("read");
         return 0;
      }
      int write_status =  write(fd_cpy, buf, read_status);
        if (write_status == -1) {
         perror("write");
      }
      close(fd);
      close(fd_cpy);

   return 0;
}
```
