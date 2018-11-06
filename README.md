# pomo

Simple countdown(`count.sh`) and pomodoro technique timer(`pomo.sh`) timer.

`mplayer` is required to use the scripts without modifications.


## pomo.sh

This script shows a simple countdown for each phase, both work and break time can be entered interactive or specified via the command line as follows:

 * two arguments
    * fist specifies the work time in minutes
    * second specifies the break time in minutes
 * four arguments
    * first argument work time in minutes
    * second argument additional work time in seconds
    * third argument break time in minutes
    * last argument additional break time in seconds


## count.sh

If `-s` is given as first command line argument, the script does only display a progress bar and exits after the counter is over silently. Else a short message is display which shows the initial counter information and a alarm sound is played repentantly after the counter is over.

You can specify the time to count down as follows:

 * without any argument, to enter the time interactive
 * one numeric argument (time to count down as seconds)
 * two numeric arguments
    * first numeric argument specifies the minutes to count down
    * second numeric argument specifies the seconds to count down
 * three numeric arguments
    * first numeric argument specifies the number of hours to count down
    * second numeric argument specifies the minutes to count down
    * last numeric argument specifies the seconds to count down


## License
This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).


## Author Information
- [Markus Mroch (Mr. Pi)](https://github.com/Mr-Pi) _git-contact@mr-pi.de_

