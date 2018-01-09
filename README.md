# Markus-LaTeX-poster-guide

This small series of example posters discusses some of the available approaches to create a poster in LaTeX,
in the light of commonly faced difficulties, especially vertical alignment of boxes.
I focus particularly on the requirements of a template used as part of the corporate identity of an institution.
Ideally such a template should default to as many of the desired design elements as possible, while allowing 
maximum flexibility for the users to craft the specific content.
Especially with respect to the tools users might want to employ the template should interfere as little as possible.

Since we already had a beamer \*.sty file we proceed in the following order.
1. ) [beamer blocks in columns](https://github.com/mamueller/Markus-LaTeX-poster-guide/blob/master/ExamplePosters/1_beamer_blocks_in_Columns/poster.pdf)
This requires a minimum of additional tools, but some user-code to control the alignment in a proper way.
The properties of boxes can be controlled from the template, so that users ideally do not have to meddle with the color or font size.

1. ) [beamer blocks with package textpos](https://github.com/mamueller/Markus-LaTeX-poster-guide/blob/master/ExamplePosters/2_beamer_blocks_with_textpos/poster.pdf)
This approach makes use of the textpos package which is recommended by the beamer user guide for absolute positioning. 
If combined with beamerblocks it allows controlling the block properties via the template (\*.sty file).

1. ) [tacolorboxes](https://github.com/mamueller/Markus-LaTeX-poster-guide/blob/master/ExamplePosters/3_tacolorboxes_in_beamertemplate/poster.pdf)
This is the most advanced and comfortable solution offering a grid of boxes and even relative positioning of boxes.
It also requires a very recent version of the package (probably requiring recent dependencies as well texlive2017 will work)
The central command \posterbox is inspired by the baposter.cls but with the possibility
to use it as a part of an existing layout (in contrast to baposter.cls which deals with the whole poster) 
At the moment we do not attempt to control the properties of the boxes (shape, colors, fonts etc.) from the template
but rely on cooperation of the users, to achieve the corporate design.


1. ) [forking baposter.cls](https://github.com/mamueller/Markus-LaTeX-poster-guide/blob/master/ExamplePosters/4_baposter_fork/poster.pdf)
The baposter.cls provides a minimal and very elegant solution to the alignment problems related to poster creation. Its central tool is the \posterbox command. I had to hack it to make it aware of a footer.
An advantage of this approach is that all in all it is much less complex (It avoids the complexity of the beamer package and its templating facilities and does not require an extra package for the boxes, as all the other approaches it does rely on tikz and pgf though)
A corporate design can be achieved by reducing the flexibility of the original baposter.cls or set other defaults.
Really fancy stuff like overlapping boxes is not possible though.


 

