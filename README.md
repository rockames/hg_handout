# Home Group Handout Generator

This generates a handout for use at homegroups.

## Usage
Simply fill out the information as per below, and type `make`.
The resulting handout will be called `main.pdf`.

### Welcome
Welcome information can be placed on the front page.
Edit the `welcome.md` file to include any welcome information you desire.
This file expects markdown and will be converted to latex for inclusion in the final flier.
Be careful that welcome information doesn't extend past one column.

### Songs
Songs are all located in the `songs/` directory.
The three songs to be sung at the event should be listed, in order, in `songs.txt`.
Simply include the song name, without the directory or extension.
For instance, to sing *In Christ Alone*, input `in_christ_alone`.

#### Adding new songs
The song list is currently small, additional songs may need to be added in the `songs/` directory (formatted in LaTeX) before use.

### Announcements
Announcements are placed in the last two columns.
Edit the `announcements.md` file to include any announcements.
This file expects markdown and will be converted to latex for inclusion in the final flier.

## TODO
 - Auto date generation
 - More intelligent song finding
 - Etc.
