# Welcome to the Dosage Timeline Calculator


### WHAT IS THIS?

This is a way of roughly calculating a timeline for your chemical experiences.
I made this for myself to make life easier, but hopefully you can see the utility for yourself.
It's as comprehensive as it needs to be, features adjustment for synergy, tolerances, custom drugs,
overall intensity and several preset days, plenty of keyboard shortcuts, some indicator lines, editing,
an ordered schedule, and can change time formats to suit.

It was built in gamemaker since that's the only language I know, which is C based but has a nice GUI
and I don't have to learn new Java or Python syntax. for this reason it will work for now only on WINDOWS
as I am unable myself to let it work on other operating systems. Maybe someone will take over and create
a superior version to port over; who knows.

![This is an image](https://media4.giphy.com/media/cMl6Y94xI2n6tMhcTg/giphy.gif?cid=790b76113bff182df4241406093c94b51c6abd9df7ae1e6c&rid=giphy.gif&ct=g)

## HOW DO I INSTALL/USE THIS + TOO LONG DIDN'T READ

**Download the DSGCalc2.rar file and extract anywhere you like, open the DGCCalc2.exe and the program will launch Enter your drug, dosage, the time you plan to take it and hit enter. The entry will appear on the last page on the right, chronologically listed. To edit entries click on the specific one, adpat and hit enter again, or to delete just click and don't re-submit. The schedules are saved to file automatically and to clear a preset just press escape or hit clear. You can use the arrow keys to change hour and dosage, or hold shift and arrows to change drug/incremental dosage. numbers 1-5 change presets. Enjoy.**
**Add your custom drugs by going to %USERNAME%/appdata/local/DSGalc2/list.txt edit, save + relaunch. You can copy other people's text files or custom drugs and paste in, if it stops working or crashes you may have messed up the order, delete the file and it will recreate itself from default**


## WHAT ARE THE AXIS?

TIME VS INTENSITY

This seemed the smartest way to go about it, a drug has its own set of initial stats you can set 
in the Users/%USERNAME%/appdata/local/DSGalc/list.txt file which I will explain.

```
DRUG NAME
COLOUR
PSYCHEDELIC/STIMULATING/DISSOCIATING, (percentage must add up to 100%)
BASE DOSAGE
INTENSITY BY HOUR T0 T1 T2 T3 T4... T19 T20
UNIT (1=mg, 2=ug, 3=g)
```
Using this file you can create up to 30 custom drug profiles

The intensity scales from 0-10 within the parameters, and these are taken at your *BASE DOSAGE*
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

If you mess with the syntax of the notepad then it may get buggy so make sure you keep to the rules.
You can swap out any of the default drugs, or if you create your own can put the route of administration
for example, MDMA (ORAL) vs MDMA (NASAL) as these will have different levels of intensity over different 
periods of time.
If you completely cock it up, delete the file and it will be recreated from scratch (but remember you will lose 
your custom chems), you could always save different versions as backups.

**The unit given will change the dosage increments in addition to their display in the schedule so it's worth doing (EG G, mg or ug)**

## THE INTERFACE

Choose your fighter. Your drugs will be shown in this list and your selection will be highlighted and displayed in the box at the top of the window.
The dosage number on the right shows the base dosage of the drug, click this to reset your dosage to default.
Dosage is maxed at 1000.

### EFFECT 

What does it do? 
First and foremost it will colour based on Psychedelic, Stimulating, and Dissociating properties (RED, GREEN, BLUE effectively) that were
given in the stats. It will adjust the overall intensity, by counting the number of drugs in a column and removing 5% sequentially
for every combination. for example,
```
3 drugs combo
100*0.95 = 95
95*0.95 = 90.2
90.2*0.95 = 85.7
```
Why? Well because drugs typically dont add up in a linear fashion and this provides a more realistic
interpretation.

Synergy is not drug specific but just relates to the number of drug interactions on a specific hour, which just reduces the overall intensity by a calculated amount. (so 3 drugs would be reduced by around 15%)
It's not an exact science but it's a good generalisation that 3 different drugs isn't 3 times as fucked up, so it's a small adjustment to account for that, especially when many small doses can end up being something large which typically doesn't happen.


### TOLERANCE/DECAY

As a rule, some chems more than others will work less as time progresses. For this reason psychedelic effect + stimulants will
decay their colour to transparent based on the volume of that particular stat. This should give a more realistic depiction
and allow the effect to taper off over time given heavy usage over many hours.

Drug effects will also be extended over time if a large portion of hours are spent above a treshold, so a kind of "oversaturation" can occur
leading drugs to last longer than their general effect taken at larger doses. 

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
set at the start and finish of your event/time and the relevant peak + low you are aiming for 
around that time

### SCHEDULE + PRESETS

Presets save automatically of which there are 5. You will need to clear them one by one, or delete 
the text files associated.
The schedule will order itself chronologically so no need to worry and the timestamp will 
change depending on settings. **You can click on these individually to edit or delete**

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

-This is not bug tested, so dont be surprised if things are a bit scratchy although I've managed to fix
everything I've come into contact with yet, though i'm sure things have slipped through the net.


-If in doubt, delete all the text files in Users/%USERNAME%/appdata/local/DSGalc2 and they will be recreated fresh on startup, but you will lose your list file so if there's anything you want to keep, save a backup.
