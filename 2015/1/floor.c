#include <stdio.h>

int main()
{

    char input[] = "";
    int length = 0;
    int floor = 0;
    int floorxd = 0;
    int position = 1;

    while (input[length] != '\0')
    {
        length++;
    }

    for (int i = 0; i < length; i++)
    {
        if (input[i] == '(')
        {
            floor++;
        }
        else
        {
            floor--;
        }
    }

    for (int i = 0; i < length; i++)
    {
        if (input[i] == '(')
        {
            floorxd++;
        }
        else
        {
            floorxd--;
        }
        if (floorxd == -1)
        {
            position = i + 1;
            break;
        }
    }
    printf("Floor: %d\n", floor);
    printf("Position: %d\n", position);
}