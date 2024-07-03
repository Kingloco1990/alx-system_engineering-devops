#!/usr/bin/python3
"""
Script to fetch and export to-do list information for all users to a JSON file.

This script retrieves data from the JSONPlaceholder API
(https://jsonplaceholder.typicode.com/) to fetch details of all users
and their corresponding to-do lists.

The retrieved to-do lists are then exported to a JSON file named
`todo_all_employees.json`.

Usage:
    $ python3 script_name.py
"""
import json
import requests

if __name__ == "__main__":
    # Base URL for the API
    url = 'https://jsonplaceholder.typicode.com/'

    # Fetch details of all users
    users = requests.get(url + 'users').json()

    # Write to-do list of all users to a
    # JSON file named `todo_all_employees.json`
    with open("todo_all_employees.json", "w") as file:
        json.dump({
            user.get('id'): [{
                'username': user.get('username'),
                'task': todo.get('title'),
                'completed': todo.get('completed')
            } for todo in requests.get(
                url + 'todos', params={'userId': user.get('id')}).json()]
            for user in users
        }, file)
