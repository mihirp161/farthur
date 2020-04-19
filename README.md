Project
-------
farthur (fart + a generic name, *Arthur* = farthur)

Install
-------
`````r
devtools::install_github("opendatasurgeon/farthur")
library(farthur) 

#then enter 1 to choose "1. ALL"
`````
*Not worthy of CRAN, believe me.*

Note
-----
Ignore the `"Rtools required to build packages..."` warning, if it occurs. It occurs randomly on various machines due to me including binary release within same github repository.

If you are on Debian/Ubuntu you can get VLC by running the following in a terminal:     

`sudo apt-get install vlc` 

since there are no paplay utility from the Pulse Audio system, or the aplay utility from the ALSA system in both Debian/Ubuntu.

OS Support
----------
Windows and all of the Unix! *(Windows OS 8 & up, Mac OS, various Linux OS)*

Project Description
--------------------
Want to humiliate yourself (possibly around your colleagues) whenever you make an error during R compilation? Then look no further. Download this package, and put this in your option space like so:    
`options(error = function() {fart(takes= NA)})`     
After that, whenever you make an error a nice, surreal, natural sound will come out of your IDE :) You're welcome!

*Documentation and more details are in .tar files*          
*A helper function to make this package compatible across various OS was taken from [rasmusab](https://github.com/rasmusab)*

Example
-------
1) `farthur::fart()` or `farthur::fart(takes= NA)`
2) `options(error = function() {fart(takes= NA)})` or `options(error = function() {fart()})`

Author
-------
Mihir Patel

Status
------
Working: version 0.0.7      
Next: More farting noises in the farty kingdon family.    

Language
---------
R

Imported Packages
----------
audio, stringr

License
--------
MIT
