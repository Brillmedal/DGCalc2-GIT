# Welcome to the Dosage Timeline Calculator


### WHAT IS THIS?

This is a way of roughly calculating a timeline for your chemical experiences.
I made this for myself to make life easier, but hopefully you can see the utility for yourself.
It's as comprehensive as it needs to be, features adjustment for synergy, tolerances, custom drugs,
overall intensity and several preset days, plenty of keyboard shortcuts, some indicator lines, editing,
an ordered schedule, and can change time formats to suit.

**UPDATE: You can now edit compound stats within the app voiding need to edit text files.**

This is avaliable on Windows and Mac; and was built in gamemaker which is a C based language.

![This is a gif](https://media1.giphy.com/media/fDAh9OtsScmWw9yW4J/giphy.gif?cid=790b7611061a02d95c8cc803ca28a0ac492884c58fc5740e&rid=giphy.gif&ct=g)

## HOW DO I INSTALL/USE THIS + TOO LONG DIDN'T READ

### Windows

**Download the DSGCalc2-WINDOWS.rar file and extract to a folder, open the DGCCalc2.exe and the program will launch. Enter your drug, dosage, the time you plan to take it and hit enter. The entries will appear on the last page on the right, chronologically listed. To edit entries click on the specific one, adapt and hit enter again, or to delete just click to remove. The schedules are saved to file automatically and to clear a preset just press escape or hit clear. I recommend keyboard shortcuts for smoother usage. You can use the arrow keys to change hour and dosage, or hold shift and arrows to change drug/incremental dosage. numbers 1-5 change presets. Enjoy.**
**Add your custom drugs by editing the stats and this should be fairly self explanatory**

### Mac

**Download the DSGCalc2-MAC.rar file and extract anywhere you like, open the DGCCalc2.app and since it's not signed with dev certificates (I'm not paying $100 to do this) you'll have to try launch first from the finder, ctrl-click the app and hit open. It may pop up and warn you it's not signed and you may have to go to the security centre to make an exception for the program. It should open fine from here onwards.
The program will launch, Enter your drug, dosage, the time you plan to take it and hit enter. The entry will appear on the last page on the right, chronologically listed. To edit entries click on the specific one, adapt and hit enter again; or to delete just click to remove. The schedules are saved to file automatically and to clear a preset just press escape or hit clear. I recommend keyboard shortcuts for smoother usage. You can use the arrow keys to change hour and dosage, or hold shift and arrows to change drug/incremental dosage. numbers 1-5 change presets. Enjoy.**
**Add your custom drugs by editing the stats and this should be fairly self explanatory**

## WHAT ARE THE AXIS + WHAT DO STATS DO

TIME VS INTENSITY

The intensity scales from 0-8 within the parameters, and these are taken at your *BASE DOSAGE*
for example
```
Your base dosage of LSD is 100ug (The dosage from which you would normally base your experiences off of)

Hour 0 = 0 intensity
Hour 1 = 5 intensity
Hour 2 = 7 intensity
Hour 3 = 8 intensity
Hour 4 = 8 intensity
...
So an entry of 50ug would now read the intensity, times by the dosage which is half of the base dosage, adjust intensity
to account and then display on the graph as half the height of a standard dose.
```
The duration vs intensity scale is measured over 24 hours, starting at hour 0, then hour 1 the intensity
you would be feeling, then the intensity at hour 2 ect. If you are unsure of these do your best to guess
and do your research. 

If you can assume that intensity of 3 is only just noticeable as a dizzyness, and 6 being fairly faded then it's not hard to see that visually the larger dose appears to last twice as long as the smaller dose, as it trails towards the end; and
there is effectively no need for a larger timespan for larger doses. Same time, lower perceived intensity.

**The unit given will change the dosage increments in addition to their display in the schedule so it's worth doing (EG G, mg or ug)**

### EFFECT 

What does it do? 
First and foremost it will colour based on Psychedelic, Stimulating, and Dissociating properties (RED, GREEN, BLUE effectively) that were
given in the stats. It will adjust the overall intensity, by counting the number of drugs in a column and removing a percentage of the effect for every combination on that hour

Why? Well because drugs typically dont add up in a linear fashion and this provides a more realistic
interpretation.

Synergy is not drug specific but just relates to the number of drug interactions on a specific hour, which just reduces the overall intensity by a calculated amount. (so 3 drugs would be reduced by around 15%)
It's not an exact science but it's a good generalisation that 3 different drugs isn't 3 times as fucked up, so it's a small adjustment to account for that, especially when many small doses can end up being something large which typically doesn't happen.

## THE INTERFACE

Choose your fighter. Your drugs will be shown in this list and your selection will be highlighted and displayed in the box at the top of the window.
The dosage number on the right shows the base dosage of the drug, click this to reset your dosage to default.
Dosage is maxed at 1000.

### TOLERANCE/DECAY

As a rule, some chems more than others will work less as time progresses. For this reason psychedelic effect + stimulants will decay their colour to transparent based on the volume of that particular stat. This should give a more realistic depiction and allow the effect to taper off over time given heavy usage over many hours.

Drug effects will also be extended over time if a large portion of hours are spent above a treshold, so a kind of "oversaturation" can occur leading drugs to last longer than their general effect taken at larger doses. 

### ZOOM

Expand on graph to show only 12 hours at a time, which can be scolled either left or right to move view.

With zoom disabled the arrows will change relative time incrementally. The numbers along the bottom will shift along with
the schedule and the current selected hour.

### MINI GRAPH DISPLAY

As it looks, averages the stacks of cells to make visualisation easier. It can become confusing to see
lots of shades on the graph below but the lower effects will be cancelled out and is a better overall
depiction of how strong an effect will be over time.

### INDICATORS

Make of these what you will, these are reference points for your use. A good use case would be
set at the start and finish of your event/time and the relevant peak + low you are aiming.

### SCHEDULE + PRESETS

Presets save automatically of which there are 5. You will need to clear them one by one.
The schedule will order itself chronologically so no need to worry and the timestamp will 
change depending on settings. **You can click on these individually to edit or delete**

### EDIT CONSTANTS

I've made some of the parameters avaliable to edit in the "Constants.txt" file found in the same local folder.
Slight descriptions on there though really it's hard to explain exactly what they do, if you want to play around just edit, save + relaunch.
If you think you've cocked it up or can't remember the default then delete the file and it will be recreated to default settings.
If you want to disable effect decay then set those values to zero, or if you want to disable the drug synergy then set to zero. I can't see why you would want to change most of these but at least you have the opportunity if you dont like the how they adjust the results.


## CONTROLS 
```
LEFT/RIGHT = HOURS
SHIFT + LEFT/RIGHT = DRUG CHANGE
UP/DOWN = DOSAGE(+10)
SHIFT + UP/DOWN = DOSAGE(+1)
ENTER = SUBMIT
ESC = CLEAR 
1-5 = PRESETS
```

### HAVING TROUBLE?

-This is not evtensively tested, if theres anything buggy be sure to let me know and I will probably be happy to tackle it 


-If in doubt and selecting compounds is causing a crash, you can reset the chems to default in the edit menu **or** 
delete all the text files in Users/%USERNAME%/appdata/local/DSGalc2 or Users/%USERNAME%/Library/Application Support/%APP ID% and they will be recreated fresh on startup, but you will lose your list file so if there's anything you want to keep, save a backup.
