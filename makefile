main.pdf : main.tex announcements.tex song1.tex song2.tex song3.tex songs.txt welcome.tex discussion.tex verse.tex
	latexmk main.tex -pdf

announcements.tex : announcements.md
	./makemap.sh
	pandoc announce_map.md -o announcements.tex

welcome.tex : welcome.md
	pandoc welcome.md -o welcome.tex

discussion.tex : discussion.md
	pandoc discussion.md -o discussion.tex

verse.tex : verse.txt
	./bib.sh bible `cat verse.txt` | tail -n +2 > verse.md
	echo "\n --" `cat verse.txt` >> verse.md
	sed -i 's/^/ > /' verse.md
	pandoc verse.md -o verse.tex

song1.tex : songs.txt
	cp songs/`sed -n '1p' songs.txt`.tex song1.tex

clean :
	rm -rf song1.tex song2.tex song3.tex welcome.tex announcements.tex
	rm -rf main.aux main.fls main.log main.fdb_latexmk main.pdf
