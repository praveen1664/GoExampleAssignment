# GoExampleAssignment

## The repo contains the following stuff

## main.go 
The file is the core of the repo which ontains a simple go api which provides a response in true/ false whether the date ranges posted to this api are overlaping or not.

## interface.sh

You need to run this file to test this api. Please share your dte ranges in below input format
        # Date Range Overlap Checker CLI
        # Range 1 Start (YYYY-MM-DDTHH:MM:SSZ): 2024-01-21T12:00:00Z
        # Range 1 End (YYYY-MM-DDTHH:MM:SSZ): 2024-01-21T18:00:00Z
        # Range 2 Start (YYYY-MM-DDTHH:MM:SSZ): 2024-01-21T15:00:00Z
        # Range 2 End (YYYY-MM-DDTHH:MM:SSZ): 2024-01-21T20:00:00Z


## Makefile
This is the makfile used to compile the code.


## Githubactions workflow
GitHub Actions workflow triggers on pushes to the main branch, checks out the repository, sets up Go, and then runs the make build command.

