#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

/**
 * infinite_while - This function enters an infinite loop
 *                  and sleeps for 1 second in each iteration.
 *
 * Return: 0 when the loop is terminated but in practice,
 *         this function is intended to run indefinitely.
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - the entry to a program that creates 5 zombie process
 *
 * Return: 0 on success
 */
int main(void)
{
	int children = 0;
	pid_t pid;

	while (children < 5)
	{
		pid = fork();
		if (pid)
		{
			printf("Zombie process created, PID: %i\n", (int)pid);
			children++;
		}
		else
		{
			exit(0);
		}
	}

	infinite_while();

	return (EXIT_SUCCESS);
}
