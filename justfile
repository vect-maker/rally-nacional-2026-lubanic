# List available recipes
default:
    @just --list

# Compile slides to PDF
compile:
    typst compile slides/main.typ slides/main.pdf

# Watch for file changes and recompile automatically
watch:
    typst watch slides/main.typ slides/main.pdf
