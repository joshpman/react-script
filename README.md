# react-script
Before reading, this script assumes you already have npm installed, if you do not please find a tutorial for that before attempting to use this

To setup:
**All of the modifications inside your bin directory will most likely have to be run with sudo

1. Copy this script into /usr/local/bin directory
2. Go to your home directory and then edit .bashrc -- May also be .bash_profile or .zshrc depending on your setup
3. Make the script runnable by doing "sudo chmod +x react-script.sh"
4. Add the following line in "export PATH="$HOME/bin:$PATH", place it at the bottom unless you have a seperate preference
5. Apply changes with source ~/.bashrc or whichever directory you placed it in

To use:
1. Navigate to the directory of your project
2. Run react-setup.sh <project name> and wait while everything downloads
3. Your project is now built, you can test it by running "npx webpack serve --open" in your terminal


If you have any modifications you feel will better the script please feel free to help out :)
The goal of this script is to make building personal react projects less of a pain without jumping straigh into build-react-app
   
