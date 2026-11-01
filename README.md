# Compiler Construction Lab

This repository contains practical implementations, lexical analyzers, and parsers developed for the **Compiler Construction Lab** course using **LEX (Flex)** and **YACC (Bison)**.

---

## 📂 Practicals Overview

| Practical | Name of the Experiment | Tool Used |
| :--- | :--- | :--- |
| **Practical 1** | Introduction to LEX tool, metadata, and patterns. | LEX / Flex |
| **Practical 2** | Count comments, keywords, identifiers, words, lines, and spaces. | LEX / Flex |
| **Practical 3** | Count number of words starting with "A" and exponential numbers. | LEX / Flex |
| **Practical 4** | Introduction to YACC tool, and format to write YACC code. | LEX & YACC |
| **Practical 5** | Conversion of lowercase to uppercase and vice versa. | LEX / Flex |
| **Practical 6** | Conversion of decimal to hexadecimal number in a file. | LEX / Flex |
| **Practical 7** | Test lines ending with "COM". | LEX / Flex |
| **Practical 8** | Postfix Expression Evaluation. | LEX & YACC |
| **Practical 9** | Desk calculator with error recovery. | LEX & YACC |
| **Practical 10** | Parser for "FOR" loop statements. | LEX & YACC |
| **Practical 11** | Intermediate code generation for assignment expressions. | LEX & YACC |
| **Practical 12** | Validate array declarations and count dimensions. | LEX & YACC |
| **Value Added** | Intermediate code generator (ICG) for Arithmetic expression. | LEX & YACC |

---

## 🛠️ Tools & Environment

* **Operating System:** Linux / Ubuntu (WSL)
* **Lexical Analyzer Generator:** Flex
* **Parser Generator:** Bison (Yacc)
* **C Compiler:** GCC

---

## ⚡ Execution Guide

### Running Standalone Lex Programs (`.l`)
```bash
flex lex.l
gcc lex.yy.c -ll
./a.out
```
### Running Combined Lex & Yacc Programs (.l & .y)
```bash
yacc -d filename.y
flex filename.l
gcc y.tab.c lex.yy.c -ll
./a.out
```

### Practical 11: Intermediate Code Generation
From `Practical_11/`:
```bash
yacc -d parser.y
flex lexer.l
gcc y.tab.c lex.yy.c -o exp11
./exp11
```

### Practical 12: Array Declaration Validation
From `Practical_12/`:
```bash
yacc -d parser.y
flex lexer.l
gcc y.tab.c lex.yy.c -o exp12
./exp12
