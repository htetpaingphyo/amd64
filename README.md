# AMD64 Bare Metal Programming with Assembly

A minimal bare metal programming environment for AMD64/x86_64 systems using pure assembly language.

This project demonstrates how to boot directly on hardware (or emulators) without an operating system, initialize the CPU, enter long mode, and execute 64-bit assembly code.

---

## Features

- Pure AMD64 assembly
- No operating system dependency
- Own stack space initialization
- Real mode (16-bit mode) initialization
- Protected mode (32-bit mode) shifting 
- Long mode (64-bit mode) running
- Direct hardware interaction
- ELF kernel generation
- Bootable disk image creation
- QEMU support for testing
- NASM, GAS + GNU-LD based toolchain
