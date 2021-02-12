# Mass-Extract
TLDR: Short batch script utilizing 7zip to extract a number of zip or rar files recursively to a directory to merge folders together.

The Story Behind

It was a bit of a weird one figuring out how this all happened and how to do what I needed so heres my little story. Skip down further if you want an explanation of the otherwise simple code.

I created this script to make my life much easier when I had a client a few years ago who had a backup of her computer she needed restored. Now restoring a backup sounds easy depending on how it was done, well turned out it was on a stack of CDs (cheaper per GB then some flash drives but more costly than any modern SSD or HDD, so idk why it was used).

This backup wasnt done by hand using CDs as flash drives to store some files. Some software that she did not have the name, documentation, or liscense to anymore basically made copies of all her files across a number of disks.

Luckily the software did not just make a bunch of loose files, it kept everything in their original directories. It did this by splitting contents of some folders across multiple disks, disks are small, a single downloads folder that someone doesn't go back and delete all their installers from can be much more. This is very simmilar to how downloading a large folder from Google Drive will give you multiple zip files to limit the size per file. Ok, easy, just copy them all back and merge everything together. Well then there's the next problem.

Each CD had a single .rar file on it which contained the said folders, but for some reason inside the rar file the parent folder from the backup would be a .zip, and any folder in that would be zipped, and any folders in that would be zipped, and so on and so on...

Extracting every single zip folder by hand, let alone making sure none was missed, would take an ungodly amount of time. So there is the context, no for the code explanation.

How it works

The actual batch script turned out pretty concise, after all, in english its "extract all files from one place and put them together another". I'm going to explain it all even the simple parts because, well, I can.

First was to copy all the rar files to one place, then the script would be ran from that directory and extract to the computer it was ran from, however paths could be adjusted if you were wanting to output to something external or to have the rar files elsewhere.

We have a for loop with the /F flag to per file given by the parameters

"%%I" as the loop iteration variable/"I" will be the file we are working with at any given time

"IN"side of the directory

"dir" gives us the list contents of the directory "/b" makes it only the filenames (dir inherently checks subfolders btw) "/s" keeps the full pathname of each file so we can pass it along to 7zip.

zip and rar are the file types we are extracting so the dir command will only give us the paths to the files with those types

"DO" will just run whats in the () per file from the dir command

"7z x" is the extract with full paths command, extract the contents but keep the folder structure so we can merge everything back with the correct sub folders.

I replaced "7z" with the direct path to 7z.exe so it could be somewhere seperate like on a flash drive (even thought it wasnt)

"-o" is to set the output directory

""%%~nI" takes just the name of the file "I" without the path as what we are extracting. 

""%%I" gives us back the full file path which is the directory we want for our output.

"PAUSE" is just to leave the window open so I know when its done as opposed to crashing.

Afterthoughts

There is improvements that could be made, things I could have changed, but it worked for what I needed so thats that.
