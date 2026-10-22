# List available recipes
default:
    @just --list

# Render Mermaid diagrams to high-res assets
diagrams:
    npx -y @mermaid-js/mermaid-cli -i slides/assets/infra-flow.mmd -o slides/assets/infra-flow.png -b transparent -s 3

# Compile slides to PDF
compile: diagrams
    typst compile slides/main.typ slides/main.pdf

# Watch for file changes and recompile automatically
watch:
    typst watch slides/main.typ slides/main.pdf

# Export slides as images for visual inspection
preview: diagrams
    mkdir -p preview
    rm -f preview/*.png
    typst compile --format png slides/main.typ preview/slide-{0p}.png
