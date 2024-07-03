#!/usr/bin/python3
"""
Script to fetch and export to-do list information for a given user
ID to a CSV file.

This script retrieves data from the JSONPlaceholder API
(https://jsonplaceholder.typicode.com/) to fetch user details and their
corresponding to-do list based on the provided user ID.

The retrieved to-do list is then exported to a CSV file named <user_id>.csv,
where <user_id> is the ID of the user passed as a command-line argument.

Usage:
    $ python3 script_name.py <user_id>
"""
import requests
import sys
import csv

if __name__ == "__main__":
    # Base URL for the API
    url = 'https://jsonplaceholder.typicode.com/'

    # User ID from the command-line argument
    user_id = sys.argv[1]

    # Fetch user details using the user ID
    user = requests.get(url + 'users/{}'.format(user_id)).json()
    username = user.get('username')

    # Fetch to-do list for the specified user
    params = {'userId': user_id}
    todo_list = requests.get(url + 'todos', params=params).json()

    # Write to-do list to a CSV file named <user_id>.csv
    with open("{}.csv".format(user_id), "w", newline="") as file:
        writer = csv.writer(file, quoting=csv.QUOTE_ALL)
        writer.writerows([
            [user_id, username, todo.get("completed"), todo.get("title")]
            for todo in todo_list
        ])
