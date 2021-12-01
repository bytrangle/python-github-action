from os import environ, getenv
import json

print(environ)
filePath = getenv('GITHUB_EVENT_PATH', '/github/workflows/event.json')

f = open(filePath, "r")
print(f.read())