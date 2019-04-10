---
blog_post: true
guid: c26d93e8-9832-4a7b-b4fd-b258b52acb7a
title: Print to Pdf in Windows without Acrobat Writer
date:       2005-12-23 10:57:00 +00:00
layout: blog
---

(Probably) the standard way to print to
[Pdf](http://en.wikipedia.org/wiki/PDF) in Windows is to buy [Adobe
Acrobat](http://www.adobe.com/products/acrobat/main.html) or use one of
the alternatives (which come with various different licences and are of
varying quality; from experience over the last couple of years).

There is, however, a completely free alternative, providing you don’t
mind going through a couple of steps to implement it (which I don’t).

The basic premise is that you print to
[PostScript](http://en.wikipedia.org/wiki/PostScript) using a PostScript
compatible printer driver and then use
[Ghostscript](http://www.cs.wisc.edu/~ghost/) to convert from PostScript
to Pdf.

These instructions work in Windows XP but should be very similar in all
versions of Windows.

Install PostScript compatible printer.
--------------------------------------

1.  Add a Printer.
2.  Choose ‘Local printer’ and do not ‘automatically detect’.
3.  Select ‘FILE: (Print to File)’ in the list next to ‘Use the
    following port’.
4.  Choose a PS printer. I’m currently using HP Color LaserJet PS.
5.  Select whether you want to use this as your default printer and
    choose no to printing a test page.

Download and install AFPL Ghostscript
-------------------------------------

1.  Visit the [Ghostscript site](http://www.cs.wisc.edu/~ghost/) and
    follow the ‘Obtaining AFPL Ghostscript \<version&gt;’ link.
2.  Download the version for Windows, which at the time of writing is
    called gs853w32.exe.
3.  Double click the downloaded file to install. Use the defaults during
    installation.

Download and install GSview
---------------------------

1.  Visit the [GSview
    site](http://www.cs.wisc.edu/~ghost/gsview/index.htm) and follow the
    ‘Obtaining GSview 4.7 link’.
2.  Download the version for Windows, which at the time of writing is
    called gsv47w32.exe.
3.  Double click the downloaded file to install. Use the defaults during
    installation.

Print something
---------------

1.  Open a file and choose to print to your PostScript printer.
2.  On clicking the Print button, you will be prompted to specify a
    filename to save the PostScript document to. Supply the full path to
    the file here, for example ‘c:\\page.ps’. Although the .ps extension
    is optional it makes it easier to open directly in GSview if this is
    supplied.

Convert the PostScript file to Pdf
----------------------------------

1.  Double click on the ‘c:\\page.ps’ file to open it in GSview.
2.  Click OK to close the software registration prompt and you will see
    the PostScript interpretation of your file on the screen.
3.  Click File \> Convert and choose ‘pdfwrite’ as the device, a
    suitable resolution (default of 600 should be fine) and click OK.
    You will be prompted to save the converted Pdf file somewhere
4.  Enter the filename to save the file with, noting that .pdf doesn’t
    get added automatically, e.g. specify page.pdf.
5.  Open the new .pdf file in either [Adobe
    Reader](http://www.adobe.com/products/acrobat/readstep2.html) or [an
    alternative](/blog/2005-11-13-windows-adobe-acrobat-reader-alternative)
