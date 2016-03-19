# About this project
This is a set of useful cmd-batch files for Windows 2k+ cmd.exe interpretator. It offers easier way to work with VCS systems (CVS, Subversion, GIT, etc.).

## Description
  Life is much easier when you use this batches. It allows you to write common commands in a shorter way. 
 
  Standart set of commands (with covers 90% of all use cases) are these three commands:
  "```s```" (show current status), "```c```" (_commit_) ? "```u```" (_update_).
  Add "```ps```" (push) and "```pl```" (pull) for Git and you are done.

## More
  I should add some special words about "```ls```" and "```n```" commands (use "help" for details). 
  You can rocket up processing of multiple files. Consider example: "```c c 1 2 4```" - means '```cvs commit``` files ## 1, 2, and 4'.

  While using CVS with branches you should always use 'join' mechanism implemented in "j"/"unj" commands, 
  because this will allow you to avoid conflicts during merge and speed up the whole process.

## Example
Here is a typical work session example:

```cmd
C:\MyProject\>c s
Status for 2010-01-01 12:00am
[1]? bin\main.log
[2]? src\aux.cpp
[3]M src\main.cpp
```
```cmd
C:\MyProject\>c del 1
1=bin\main.log
File "bin\main.log" renamed to bin\.#main.log.deleted
```

```cmd
C:\MyProject\>c a 2
2=src\aux.cpp
File "src\aux.cpp" was added. Use "cvs commit" to commit your changes.
```

```cmd
C:\MyProject\>c s
Status for 2010-01-01 12:01am
[1]A src\aux.cpp
[2]M src\main.cpp
```

```cmd
C:\MyProject\>c c
cvs: commit. Your changes were committed.
```

```cmd
C:\MyProject\>c s
Status for 2010-01-01 12:02am 
```

## Requirements:
  OS: Win 2k/XP/Vista/7/8/10 (both x86 and x64)

## Installation:
  1) Add path of the folder into PATH environment variable.
  2) Done. :)

Use 'ant' 'mvn' 'cvs' and 'svn' command as usually. But please note that this commands are batch-files now. Don't forget to add 'call' clause in your own batch-files while using them. Ex.: ```call cvs update``` instead of ```cvs update```

### General usage:
  Commandline: "```<vcs_shorcut> [<command>] [<options>] [<files>]```"

where
  - vcs_shorcut - is "c" for CVS, "s" for Subversion, "g" for Git, etc. 
You can find and examine "c.cmd" in this folder to find out how it works.

You can run ```<vcs_shorcut>``` command ("```c```" for example) to see all avalaible commaind with short description.
Use "```<vcs_shorcut> h```" command to get detailed description for a command.

## Expand
You can expand command list by adding new batch files into appropriate folder ("c" folder for CVS etc.). 
This means that by creating file "foo.cmd" in "c" folder you will get command "```c foo```".
Command in the "vcs" folder are common for all VCS's - "foo.cmd" in "vcs" folder will add commands "```c foo```", "```s foo```", "```g foo```" etc. with the same common logic.
If you run unsuported command (unlisted in the correspondent folder - "c", "s", "vcs", etc.) then your VCS usual command will be executed.
For instance if you run "c update" (but there is no "update.cmd" file in "c" folder) then usual "cvs update" will be executed. "g push" will execute "git push" and so on...

__Have fun.__

## P.S. 
Ah! I've added CVS, Subversion, Ant and Maven to this repository to make your life even more easy. There is no need to install them now.
