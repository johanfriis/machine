## manage system services
$ systemctl enable docker
$ systemctl disable docker

## update system `editor`
$ sudo update-alternatives --config editor

## run a script as a daemon
## See: https://stackoverflow.com/questions/19233529/run-bash-script-as-daemon
$ setsid script.sh > log-file-or/dev/null 2>&1 < /dev/null &
