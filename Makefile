
render:
	quarto render

release:
	gh release create v0.6.2 ./_book/Cytopia-Proceedings.pdf \
		--title "Version 0.6.2" \
		--notes "QRCode for each article" \
		--prerelease
