.PHONY: all render separate b_and_w clean

all: clean render separate b_and_w

render:
	quarto render

separate:
	mkdir -p _book/final

	pdftk _book/Cytopia-Proceedings.pdf cat 1 output _book/page_debut.pdf
	pdftk _book/Cytopia-Proceedings.pdf cat end output _book/page_fin.pdf
	pdftk _book/Cytopia-Proceedings.pdf cat 2-r2 output _book/corps_couleur.pdf

	pdftk _book/page_debut.pdf _book/page_fin.pdf cat output _book/final/Cytopia-2026-color-ext.pdf

b_and_w:
	gs -sOutputFile=_book/final/Cytopia-2026-gray-int.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dNOPAUSE -dBATCH _book/corps_couleur.pdf

clean:
	rm -Rf _freeze .quarto _book

release:
	gh release create v0.9.4 ./_book/final/*.pdf \
		--title "Version 0.9.4" \
		--notes "Separate pdf for covers and body of the book + some fixes" \
		--prerelease

release_with_contracts:
	gh release create v0.9.2 ./_book/Cytopia-Proceedings.pdf ./_contracts/* \
		--title "Version 0.9.2" \
		--notes "Release with signed contracts" \
		--prerelease

book_cover:
	bunx --yes --location=global -p @remotion/cli@4.0.539 remotion still \
		'https://openeugenia.github.io/Graphic-charter/studio' 'BookCover' 'fig/cover-book.png' \
		--scale='2' --props=fig/cover-book.json

book_back:
	bunx --yes --location=global -p @remotion/cli@4.0.539 remotion still \
		'https://openeugenia.github.io/Graphic-charter/studio' 'BookBackCover' 'fig/back-book.png' \
		--scale='2' --props=fig/back-book.json
