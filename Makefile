
render:
	quarto render

release:
	gh release create v0.6.3 ./_book/Cytopia-Proceedings.pdf \
		--title "Version 0.6.3" \
		--notes "QRCode for each article and waiting last descriptions/articles" \
		--prerelease
