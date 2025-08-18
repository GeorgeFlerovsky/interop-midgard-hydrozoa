
.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo
	@echo "Targets:"
	@echo "  help      -- show this help"
	@echo "  shell     -- open nix dev shell"
	@echo "  spec     -- generate the whitepaper pdf"
	@echo "  nix-spec -- open nix shell & spec"
	@echo "  clean     -- clean up latexmk files"

.PHONY: shell
shell:
	nix develop

.PHONY: spec
spec:
	latexmk -pdf -verbose -file-line-error -synctex=1 -interaction=nonstopmode

.PHONY: nix-spec
nix-spec:
	nix develop --command bash -c "latexmk -pdf -verbose -file-line-error -synctex=1 -interaction=nonstopmode"

.PHONY: clean
clean:
	latexmk -C
	rm -f interop-midgard-hydrozoa.bbl
