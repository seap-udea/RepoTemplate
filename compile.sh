#!/bin/bash
make clean
make program.out
make program.exe
make tests/tests_Module.exe
./tests_Module.exe
./program.out
./program.exe
