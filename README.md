# Flex-Lexical-Analyzer


# Flex and Yacc Project Instructions

This README provides complete instructions for running Flex and Yacc files, configuring build tasks in Visual Studio Code, and using a Makefile in this project.

## Running a Normal Lex File

To compile and execute a normal Lex file, use the following commands in your terminal:

```bash


//Run for normal Lex file 
/* flex CheckChar.lex
gcc lex.yy.c
./a
*/


/*
Go to Terminal -> Configure Tasks -> Create tasks.json file from template -> Others. This will create a tasks.json file.
{
    "version": "2.0.0",
    "tasks": [
       {
          "label": "Build and Run Flex",
          "type": "shell",
          "command": "flex ${fileBasename} && gcc lex.yy.c && ./a",
          "group": {
             "kind": "build",
             "isDefault": true
          }
       }
    ]
 }
*/


//For the Make File 

main: cal.l cal.y
	yacc -d cal.y
	lex cal.l
	gcc cal.tab.c lex.yy.c
	a <input.txt> output.txt