---
blog_post: true
guid: 1643f8615c819aa942f36de82e7aca72
title: Set background transparency in GIMP
date:       2005-09-09 17:37:00 +01:00
layout: blog
---

I’m very much **not** a graphical person but when forced to dabble in
any kind of image manipulation have always tried to use [The
GIMP](http://www.gimp.org/), over any commercial offerings.

Just this afternoon I’ve spent some time trying to make the background
of a very simple image transparent. The image is a filled shape on a
white background. I wanted the white background to be transparent.

I *think* I’ve finally found the best way to achieve this but may be way
off mark.

1.  Open the original image (jpeg image in this case).
2.  Use the ‘magic wand’ (Select contiguous regions) and select the
    coloured shape.
3.  Move the selected shape to the side of the image.
4.  In the Layers view you should now have a new ‘Floating Selection
    (Floated Layer)’. Right click on this layer and select ‘New layer’.
    This converts the transient layer into a real layer.
5.  Click on the background layer to ‘select’ the background of the
    image.
6.  Select Layer \> Transparency \> Add Alpha Channel.
7.  We can now set the background to transparent by using Layer \>
    Transparency \> Colour to Alpha and selecting our background colour
    (white in my case) as the From colour.
8.  Click Ok to set the background to transparent.
9.  Click on the Floated Layer (this is what the layer will be called
    unless you renamed it) to display it to the side of the image.
10. Click the cross-hair (Move layers & selections) tool and move the
    shape onto the now transparent background.
11. That’s it, apart from saving the image in a format that either saves
    the layers (.xcf at least, maybe more) or at least deals with
    transparency (.gif and .png).

***Update 18:07** It seems that anything over and above simple shapes as
I had and this practice fails because it’s not easy to initially cut the
’foreground’ image out. But then again, maybe that’s just because I
don’t know how to effectively ’cut’ images…*
