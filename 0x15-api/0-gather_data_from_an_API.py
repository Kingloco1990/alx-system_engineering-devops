"""
Fetches and displays completed to-do list information for a specified user ID.

This script retrieves data from the JSONPlaceholder API
(https://jsonplaceholder.typicode.com/) to fetch the user details and their
corresponding to-do list based on the provided user ID.

Usage:
    $ python script_name.py <user_id>
"""
import requests
import sys

if __name__ == "__main__":
    # API base URL
    url = 'https://jsonplaceholder.typicode.com/'

    # User ID from command-line argument
    user_id = sys.argv[1]

    # Fetch user details
    user = requests.get(url + 'users/{}'.format(user_id)).json()

    # Fetch to-do list for the user
    params = {'userId': user_id}
    todo_list = requests.get(url + 'todos', params=params).json()

    # Filter completed tasks
    comp_tasks = [todo.get(
        'title') for todo in todo_list if todo.get('completed') is True]

    # Print summary of completed tasks
    print('Employee {} is done with tasks({}/{}):'.format(
        user.get('name'), len(comp_tasks), len(todo_list)))

    # Print each completed task title
    [print('\t {}'.format(comp)) for comp in comp_tasks]
