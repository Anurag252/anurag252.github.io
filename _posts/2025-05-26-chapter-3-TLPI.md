---
            title: "Chapter 3 - System Calls"
            date: "2025-08-26T08:03:26+01:00"
            categories: ["TLPI"]
            tags: [c,rust,tlpi,linux]
            layout: post
---

# System Calls

- Will always switch to Kernel mode
- Syscall number is fixed but user identify it by syscall func name.

## How sys call works

- When userspace programs call syscall, then they store a number corresponsing to syscall on a register `%eax`
- The wrapper that has this `mov` command to register will also include a `trap` called `0x80` . In most newer architecture `sysenter` is used to enter kernel mode.
- When this trap is encountered, CPU will start the `system_call()` subroutine located in `arch/i386/entry.S` [see](https://www.cs.dartmouth.edu/~sergey/cs258/rootkits/entry.S).
  - this saves the register value to kernel stack
  - checks the validity of syscall and executes it
  - returns the value to program stack and switches to user mode
- `sys_call_table` has all the list of system calls and its numbers.
- for example - `sys_execve` syscall has number 11 and hence in `sys_call_table` 11th entry store the address of routine for `sys_execve` handler.
- use `strace` to trace syscalls in a program.

## library functions

- wrappers around syscall.
- Most common Linux is implemenetd in GNU C
- glibc version is determined from `/lib/libc.so.6`
- one can also perform list dynamic list dependency like `ldd myprog | grep libc` to check the version of libc

```
#include <gnu/libc-version.h>
const char *gnu_get_libc_version(void);

```

One can also call `gnu_get_libc_version` to get this.

```C
#include <stdio.h>
#include <gnu/libc-version.h>
#include <errno.h>

int main() {
    const char* version_no = gnu_get_libc_version();
    if !(version_no) {
      fprintf(stderr, "Error: Failed to retrieve glibc version\n");
      return 1;
    }
    printf("version number :- %s\n", version_no);
    return 0;
}
```

and output

```bash
Anurag252 ➜ /workspaces/codespaces-blank $ gcc main.c ; ./a.out
version number :- 2.39
```

## error handling from syscall and library functions

- a few prgms never fail like `getpid` and `exit` and their return need not be checked
  - system call failures set `errno`
  - `perror` prints an error message pointed by `msg` arguement and then `errno` error
  - `strerror` returns error corresponsing to `errono`.

```C
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>

int main() {
   ssize_t read_bytes = open("some/file", 1);
   if (read_bytes == -1) {
        perror("some error occured:- ");
        printf("%s\n", strerror(errno));
        return 1;
   }
   return 0;

}

```

- std lib function
  - some return errno, some do not set errno but return an int, other do not do both
  ```
  atoi(), atol(), and strtol()
  ```

## feature flags

- one can define feature flags like this

```c

#include <stdio.h>
int main() {

  if (MY_FEATURE) {
      printf("hello\n");
      return 0;
  } else {
      printf("bye\n");
      return 1;
  }

}
```

to test

```bash
gcc -D MY_FEATURE=0 main.c ; ./a.out
```

- there are pre-defined FFs which enable and disable multiple certain functionality and specially platform related code
  - \_POSIX_SOURCE
  - \_POSIX_C_SOURCE
  - \_XOPEN_SOURCE

## system data type

- there are some pre-defined type `sszie_t` from `open` which is int but to capture platform related specifics, they are system defined
- generally have `_t` at the end and it appears as `typedef int pid_t;`
- most available in `<sys/types.h>`

## Exercise

```
man 2 reboot
This  system  call  fails  (with  the  error  EINVAL)  unless magic equals LINUX_REBOOT_MAGIC1 (that is, 0xfee1dead) and magic2 equals LINUX_RE‐
       BOOT_MAGIC2 (that is, 0x28121969).  However, since Linux 2.1.17 also LINUX_REBOOT_MAGIC2A (that is, 0x05121996)  and  since  Linux  2.1.97  also
       LINUX_REBOOT_MAGIC2B  (that  is,  0x16041998) and since Linux 2.5.71 also LINUX_REBOOT_MAGIC2C (that is, 0x20112000) are permitted as values for
       magic2.  (The hexadecimal values of these constants are meaningful.)
```

These hexadecimals are birrthdates
0x28121969 - 28.12.1969 and so on
