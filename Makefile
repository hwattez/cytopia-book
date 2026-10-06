
render:
	quarto render

clean:
	rm -Rf _freeze .quarto

release:
	gh release create v0.9.0 ./_book/Cytopia-Proceedings.pdf \
		--title "Version 0.9.0" \
		--notes "Last revision and copyrights before editing" \
		--prerelease
