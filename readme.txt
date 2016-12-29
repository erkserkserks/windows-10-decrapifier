**Note that Cumulative Windows 10 updates (1501, etc) will probably reinstall all the apps because they technically do a refresh upgrade of your OS. So after you apply those updates, you'll want to run this script again.**

*Tested up to Anniversary edition.  Updated with a couple additions for 1607+

----------------- WITHOUT FURTHER ADO ---------------------

Well, this is mostly my personal preferences, and a bit of a hack job, but in case anyone else wants an easy way to do this stuff.. here it is. I prefer a more barebones OS.

!!!!!!READ THE SCRIPT FIRST, it has some options which you can change for your own preferences.!!!!!!

Removes: all the metro apps and their install packages.

Disables: Cortana, OneDrive, update delivery "optimization", a bunch of the tracking features and services, sets most of the privacy options to disabled (check through yourself afterwards though for your own preferences), and disables the xbox services. Note that most of the privacy settings are per-user, although Cortana, Delivery Optimization, and CEIP are disabled via local policy.
Tested on Windows 10 pro x64 (fresh install). Worked great on my laptop, and on a VM I used to make it. Not tested on upgraded machines from 8/7.
-------------------------------------------------------------------------------
INSTRUCTIONS:

*Open administrative Powershell console (type Powershell into the search bar, right click it, run as administrator)
get-executionpolicy
*This will show what the current policy is, usually restricted

set-executionpolicy unrestricted
*Allows you to run scripts.

(A) for yes to all

*Navigate to the directory that your script (.ps1 file) is in and type:
.\script.ps1

*The script will run. Ignore some of the errors removing apps, there are some that simply can't be removed.

*When it's done set the execution policy back to what it was before:
set-executionpolicy restricted (or whatever it was)

*Reboot the computer.

......
use at your own risk of course ;)

**Note - app icons not disappearing?:
I have noticed this: sometimes icons for apps get left behind on the start menu, they don't do anything but can't be removed. This is problem with Windows 10 when uninstalling apps via Powershell, I have had it happen once before... but not lately (perhaps M$ fixed it in a patch). Anyways it if happens to you here's a workaround: copy c:\users\USER\appdata\local\tiledatalayer from a fresh profile AFTER running the script, to your profile, overwriting what is there. The main file is tiledatelayer.edb. This will give you a default start menu but without all the useless app icons. 
