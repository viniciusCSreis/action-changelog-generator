# Usage

generate changelog after release:

```yml

name: "generate-changelog"
on:
  push:
    tags-ignore:
      - '*RC*'

jobs:
  
  generate:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: viniciusCSreis/action-changelog-generator@master
      with:
        repo-token: ${{ secrets.GITHUB_TOKEN }}
        base-branch: master
        changelog-branch: changelog


```
