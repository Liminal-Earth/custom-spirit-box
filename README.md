# custom-spirit-box

# What This Is

Simple tools for creating a 'spirit box' with any collection of mp3's

# Why This Is

We have been wondering if it is possible to use traditional methods for communicating with spooks and haunts to do divination with all the characters in the Christmas pantheon? EVPs of the Ghost of Christmas Past? Dowsing rods to find Frosty the Snowman? A rousing Ouija board session with Rudolph the Red-Nosed Reindeer?

As you probably know, a popular paranormal technique now-a-days is something called the 'Estes Method', developed by Karl Pfeiffer, Connor Randall, and Michelle Tate (and made popular through the series ‘Hellier’). One participant is blindfolded, and listening to a spirit box-- basically a radio receiver that cycles through the FM dial-- while other participants ask questions to spirits. The person listening to the box is basically undergoing sensory deprivation and cannot hear the questions - their job is to speak words they 'hear' while undergoing the method. Sometimes the words they hear line up with the questions being asked.

But it got us thinking — could we modify a spirit box to only use CHRISTMAS MUSIC. Would it be possible?

So we developed a 'Christmas Spirit Box' that plays cut up 500ms audio samples from beloved Christmas songs in a random order (there's a bit of delay and reverb added to make it slightly more spooky sounding). The bits will be unrecognizable but still give off that festive vibe. 

We had a lot of fun developing it — and now we’re wondering… 
What other custom boxes can we do in the future?
Why not a Simpson's spirit box? A Rodney Dangerfield stand-up comedy spirit box? A Ghostbuster's 'spirit box'. 
What other audio could you sample from? 

# Mac OS X

## Follow these steps

Here is how to to generate 'YOUR OWN' spirit box utilizing any mp3's you have access to.

1. Find the audio you want to use. For the Christmas Spirit Box, we pulled Christmas music from youtube. There are free downloader websites (watch out, sometimes these can be sketchy). There are also standalone programs that can do this. Or use your own personal mp3 library. 

2. In Termainal, install homebrew. https://brew.sh/

3. After you install homebrew, install `ffmpeg`. `brew install ffmpeg`

4. Run this command to split your files into smaller clips.
 
 `ffmpeg -i <YOUR MP3>.mp3 -f segment -segment_time 1 -c copy <SOME TITLE>%03d.mp3`
 
 - Here the segment time is 1 second. If you want it to be shorter, you can use milliseconds by changing 1 to "200ms" or "500ms". Keep it in quotes like that.
 
 - Where it says <YOUR MP3> make sure to pass in the actual mp3 you are splitting.
 
 - Where says <SOME TITLE> you choose a title for the files you are generating. If you pass in 'dangerfield' your split files will be dangerfield1.mp3, dangerfield2.mp3, etc.
  
5. Install `mplayer`. `brew install mplayer`

6. Make a playlist file with all your mp3s. 
  
  `for f in *.mp3; do echo $f >> playlist.txt; done`

7. Now make a script for running `mplayer`. (An example one is included in this repository.
  
  `while [[ $(mplayer -shuffle -playlist playlist.txt -delay -10 -volume 100 >/dev/null 2>&1) -eq 0 ]]; do sleep 1; done`
  
  This will run continuously. In fact, it might umm.... restart even if you kill the process. Oops! We'll figure that part out later!
  
8. Make sure to chmod +x your script before trying to run it at the command line. 
 
Please let us know if you have suggestions for improving this!

