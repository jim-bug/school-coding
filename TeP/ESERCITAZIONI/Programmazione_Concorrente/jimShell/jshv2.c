#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

#define MAX_LEGTH_LINE 50
#define MAX_LEGTH_PATH 1024
#define MAX_LENGTH_COMMAND_NAME 10
void getNameCommand(char*, char*);
int main(){
    char command[MAX_LEGTH_LINE];
    char currentPath[MAX_LEGTH_PATH];
    while (1) {
        getcwd(currentPath, MAX_LEGTH_PATH);    // ottengo la posizione attuale del filesystem, così da mandarla a video.
        printf("jsh:\"%s\">", currentPath);

        fgets(command, MAX_LEGTH_LINE, stdin);
        char commandName[MAX_LENGTH_COMMAND_NAME];
        getNameCommand(command, commandName);
        if(strcmp(commandName, "cd") == 0){     // caso speciale per il comando cd
            char *argument = strtok(command, " \n");
            argument = strtok(NULL, " \n");     // ripeto due volte questo comando, così da ottenere l'argomento del comando cd
            char newPath[MAX_LEGTH_LINE];

            strcpy(newPath, argument);
            if(strcmp(argument, "~") == 0){
                char* userName = getlogin();
                strcpy(newPath, "/home/");
                strcat(newPath, userName);     // costruisco la user path.

            }
            if(chdir(newPath) != 0){
                perror("ERROR");
            }
        }
        else{
            system(command);
        }
    }
    return 0;

}
void getNameCommand(char* command, char* commandName){
    int endPositionName = 0;
    for(int i = 0;i < MAX_LEGTH_LINE; i++){
        if(command[i] == ' ') {
            endPositionName = i;
            break;
        }
    }
    for(int i = 0; i < endPositionName; i++){
        commandName[i] = command[i];
    }
}