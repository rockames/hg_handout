main.pdf : main.tex announcements.tex song1.tex song2.tex song3.tex songs.txt welcome.tex
	latexmk main.tex -pdf

announcements.tex : announcements.md
	pandoc announcements.md -o announcements.tex

welcome.tex : welcome.md
	pandoc welcome.md -o welcome.tex

song1.tex : songs.txt
	cp songs/`sed -n '1p' songs.txt`.tex song1.tex

song2.tex : songs.txt
	cp songs/`sed -n '2p' songs.txt`.tex song2.tex

song3.tex : songs.txt
	cp songs/`sed -n '3p' songs.txt`.tex song3.tex

clean :
	rm -rf song1.tex song2.tex song3.tex welcome.tex announcements.tex
	rm -rf main.aux main.fls main.log main.fdb_latexmk main.pdf
