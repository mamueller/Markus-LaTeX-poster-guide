# Markus-LaTeX-poster-guide
 warning: **use pdflatex -shell-escape poster.tex** for the examples

This small series of self-explanatory example posters with complete source code discusses some of the available approaches to create posters in LaTeX. 
I focus particularly on the requirements of a **template** used as part of the corporate identity of my present institute.

Ideally such a template should default to as many of the desired design elements as possible, while allowing 
maximum flexibility for the users to craft the specific content.
In particular the template should interfere as little as possible with the tool the users want to employ.
It should also provide solutions for common problems.
Therefore we offer some help to avoid the sometimes unnerving problems concerning the 
**vertical alignment of boxes**.

There prefered viewing order. 
Since we already had a beamer \*.sty file we start there.
1. ) [beamer blocks in columns](https://github.com/mamueller/Markus-LaTeX-poster-guide/blob/master/ExamplePosters/1_beamer_blocks_in_Columns/poster.pdf)
This requires a minimum of additional tools, but some user-code to control the alignment in a proper way.
The properties of boxes can be controlled from the template, so that users ideally do not have to meddle with the color or font size.

1. ) [beamer blocks with package textpos](https://github.com/mamueller/Markus-LaTeX-poster-guide/blob/master/ExamplePosters/2_beamer_blocks_with_textpos/poster.pdf)
This approach makes use of the textpos package which is recommended by the beamer user guide for absolute positioning. 
If combined with beamerblocks it allows controlling the block properties via the template (\*.sty file).

1. ) [tcolorboxes](https://github.com/mamueller/Markus-LaTeX-poster-guide/blob/master/ExamplePosters/3_tacolorboxes_in_beamertemplate/poster.pdf)
This is the most advanced and comfortable solution offering a grid of boxes and even relative positioning of boxes.
It also requires a very recent version of the package, probably requiring recent dependencies as well (texlive2017 will work)
The central command \posterbox is inspired by the baposter.cls but with the possibility
to use it as a part of an existing layout (in contrast to baposter.cls which deals with the whole poster) 
At the moment we do not attempt to control the properties of the boxes (shape, colors, fonts etc.) from the template
but rely on cooperation of the users, to achieve the corporate design.


1. ) [forking baposter.cls](https://github.com/mamueller/Markus-LaTeX-poster-guide/blob/master/ExamplePosters/4_baposter_fork/poster.pdf)
The baposter.cls provides a minimal and very elegant solution to the alignment problems related to poster creation. Its central tool is the \posterbox command. I had to hack it to make it aware of a footer.
An advantage of this approach is that all in all it is much less complex (It avoids the complexity of the beamer package and its templating facilities and does not require an extra package for the boxes. It does rely on tikz and pgf though (as all the other approaches)
A corporate design can be achieved by reducing the flexibility of the original baposter.cls or set other defaults.
Really fancy stuff like overlapping boxes is not possible though. There is now also a [real poster](https://github.com/mamueller/Markus-LaTeX-poster-guide/blob/master/ExamplePosters/5_ISSPoster_beamer_with_tcolorboxes/poster.pdf) using tcolorboxes.

Remarks:
- I used symbolic links to link to the template from the different example folders.
- In the atual example I made free (and even recursive) use of the \input command to make it easy to  distinguish between the different structural layers. It should make it simple to change the content but of cause you do not have to do that. 
The same is true for the quite elaborate structure of the image subdir.

- I used an existing template that I did not develop. My guess is that the connection between the template and the usercode  of the example posters can be improved. Some of the unused settings could be removed from the template, some could be added to 
avoid duplication in the examples (e.g. some lengths to organize the central part of the poster).
Especially the LaTeX users of our institute are encouraged to propose improvements. (please fork, patch and send pull requests)


