from os import environ, getenv
import json

print(environ)
filePath = getenv('GITHUB_EVENT_PATH', '/github/workflows/event.json')

# f = open(filePath, "r")
# print(f.read())
with open(filePath) as f:
  data = json.load(f)
print(data["issue"]["html_url"])

token = getenv('GITHUB_TOKEN')
if token is not None:
  print('github token is available')