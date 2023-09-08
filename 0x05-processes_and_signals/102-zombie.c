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
* main - The entry to a program that creates 5 zombie process.
*
* Return: 0.
*/
int main(void)
{
	int children = 0;

	pid_t pid;

	while (children < 5)
	{
		/* Creates a copy of the parent process and assigns it tp pid */
		/* A copy of the parent process is a child process */
		/* fork() returns 0 to the child process and PID to the parent process */
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
	/**
	 * infinite_while() ensures that the parent process keeps running
	 * indefinitely. Therefore the created child processes are not removed
	 * from the system imediately, thus these child processes become
	 * zombie processes.
	 */
	infinite_while();

	return (0);
}
