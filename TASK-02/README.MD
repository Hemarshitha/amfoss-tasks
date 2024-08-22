TERMINAL-CHAOS!!!!!

EXPLANATION OF VARIOUS PARTS!!!

REGARDING CLONING:

First i have cloned the Terminal-Chaos repository using the git clone command into my local repository..I did face some issues as i had to merge some branches and then push this repository and i then successsfully used cd amfoss-tasks and created a directory called Handbook to store all the codes seperately..This cloning made me familiar with the basic git commands such as git push, git pull and more...The commands i learned in this task will be mentioned below this readme file...Now let me proceed how i solved the different parts..!!!



PART-I


This part was very easy..I started by running the `ls` command to see what was in the present folder so that I could make some observations and also find out ways of escaping the advancing sandstorm called “Vortex of Desolation.” To look for safety, I was using the `cd` command thereby entering directories whose names were either related to cave or house.

While inside the Eolian Caves, I made use of the `ls -la` command as a way of  finding hidden files or directories. To be more clear , the `tree` or `find` commands helped me locate any weirdly named  files like parchment.

After locating the parchment, I used the `cat` command to view its contents thereby discovering the  code. Eventually, by redirecting output from cat into file i.e. cat parchment.txt > Handbook.txt , I pushed this code into Handbook.



PART-II

Here at first i was in a wrong directory..instead of being in Terminal-Chaos i was in amfoss-tasks so couldn't find the light realm branch..Then when found i switched the directory and then used git branch -r command o see the remote brances and then i switched to the Light-Realm branch and then came back into the Eolian Caves directory and proceeded with the ls and tree command to find the hidden files and continued with it and then used grep to find the herbs with holy and good and joined Moonbloom and Mistveil which then i had to  replace it with before letter and remove the vowels and thereby my holyspell was LnnmknnlLhrsdhk..Then i ran the key.txt to find out i had to press p at 1 sec exactly ..so finally when i ran the python file the game displayed and i used the holy spell and lightbook.txt got unlocked..Found 2 codes..1 in Celestial veil Amulet and other in lightbook and i copied them to nanao file and git pushed them into the Handbook directory.


PART-III

I have switched the branch to The-Dark-Realm-I and continued with ls command and found out chestI.py..As it asked to " Use the Celestial Veil Amulet to unlock the chests found in branches Dark Realm I and II "...I used the code from Celestial Veil Amulet to unlock chestI.py and found a code which i stored it in Handbook again...Continued with the realm-II in the same way and unlocked chestII.py


PART-IV

After going through some basics of BASE-64 and with the help of Chatgpt i figured out the code from Celestial Veil Amulet cannot be used to decode...So i joined the 4 codes into a string and used echo "aHR0cHM6Ly9naXRo dWIuY29tL2FtYW5ze GNhbGlidXIvVGVyb WluYWwtQ2hhb3MtR29kU3VpdGU=" | tr -d ' ' | base64 --decode
and got the github link for GodSuite which i then cloned it to my repository.


PART-v

In GodSuite i used git log --oneline to list all the commits and found four codes listed as four stages and i decoded each code with base64 and found a code in 3rd stage which i decoded and got the link for To-the-stars-and-realms-unseen which thereby i cloned the repository and went into this directory and finally found the victory.py file which by running displayed this message

 "Congratulations Hemarshitha!!! You have successfully overcome the challenges and escaped the deadly clutches of Arrakis-dex.
You will now be able to join the war again spreading your faith for the Emperor and humankind!!
Take a screenshot of this and save it in your handbook folder along with the other codes you have collected.
Stand proud, champion!"

Git commands I learned ->


*git status: shows modified files

*git init: makes it as a git repository

*git branch -r :lists remote brances

*git add . : adds all the files to commit

*git commit -m "Example Message": commits your content, a message can be added to display in the commit log

*git push: pushes all the contents in the local branch to remote branch

*git pull: merges all the contents in the local branch from remote branch

*git branch: lists all the branches present

*git checkout <branch name>: switches from one branch to another branch

*git clone <url>: copy's all the content from the hosted URL

*git log: shows all the commits of the current branch

*git checkout <branch-from-where-you-want-to-copy> example.txt: Copy a file from another branch to the current branch



Terminal commands I learned ->

*cd <directory_path>: Change the current working directory to a specified directory

*ls: List files and directories in the current directory

*tree: Lists files and directories in a tree format

*mkdir <directory_name>: Create a new directory

*rmdir <directory_name>: deletes an empty directory

*touch <file.name>: Create a new file

*nano <file_name>: Opens the default text editor for editing or creating a file

*cat <file_name>: Display the contents of a text file

*mv <source_path> <destination_path>: Move or rename files and directories

*rm <file_or_directory>: Remove files or directories

*exit: Exit terminal session

*cp <source_path> <destination_path>: Copy files or directories from one location to another

*cat * > finalcode.txt: It will concatenate the content of all text files in the current directory and merge them into finalcode.txt

*echo -n <Base64EncodedStringHere> | base64 -d: Decodes the Base64 code

ALL CODES ARE IN HANDBOOK DIRECTORY!!







               
                 
