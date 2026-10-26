
render:
	quarto render

clean:
	rm -Rf _freeze .quarto

release:
	gh release create v0.9.1 ./_book/Cytopia-Proceedings.pdf \
		--title "Version 0.9.1" \
		--notes "Last revision and copyrights before editing" \
		--prerelease

release_with_contracts:
	gh release create v0.9.2 ./_book/Cytopia-Proceedings.pdf ./_contracts/* \
		--title "Version 0.9.2" \
		--notes "Release with signed contracts" \
		--prerelease
