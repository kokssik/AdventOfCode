#include <stdio.h>
#include <stdlib.h>

int main()
{
    // Open the file for reading
    FILE *file = fopen("./input.txt", "r");
    if (file == NULL)
    {
        perror("Error opening file");
        return 1;
    }

    // Dynamically allocate memory for the input string
    char *input = NULL;
    size_t length = 0;
    int read = getline(&input, &length, file);
    if (read == -1)
    {
        perror("Error reading file");
        fclose(file);
        return 1;
    }

    fclose(file); // Close the file after reading

    int floor = 0;
    int floorxd = 0;
    int position = 1;

    // Loop through the string to calculate the final floor
    for (int i = 0; input[i] != '\0'; i++)
    {
        if (input[i] == '(')
        {
            floor++;
        }
        else if (input[i] == ')')
        {
            floor--;
        }
    }

    // Loop through the string to find the position where floor becomes -1
    for (int i = 0; input[i] != '\0'; i++)
    {
        if (input[i] == '(')
        {
            floorxd++;
        }
        else if (input[i] == ')')
        {
            floorxd--;
        }
        if (floorxd == -1)
        {
            position = i + 1;
            break;
        }
    }

    // Print results
    printf("Floor: %d\n", floor);
    printf("Position: %d\n", position);

    return 0;
}
