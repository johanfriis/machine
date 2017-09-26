#############
### ALIAS ###
#############

## Run one-off command in current directory, in specified image
## See: https://github.com/michaloo/drun
alias drun='docker run -u $(id -u):$(id -g) -v ~/.drun:/drun -e HOME=/drun -v `pwd`:/app --workdir /app -it --rm --network=host'
