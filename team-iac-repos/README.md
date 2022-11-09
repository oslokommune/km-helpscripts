A script to grep repos if things are implemented, how many are actually using a feature,
or how many have actually updated or removed things that are deprecated

[IAC repo list](https://docs.google.com/spreadsheets/d/1CNP3PUPbv3FcWecm453RvNpLuuySWbTvZ6R3jQQRqCU/edit#gid=0)

Inspiration came from: [#184](https://github.com/oslokommune/golden-path-iac/pull/184/files)
and the question: "How many repos are using `aws_caller_identity`"

* mkdir repos
* create repolist.txt with one repository name per line ex: "km-helpscripts"
* ./checkout.sh
* ./grep.sh aws_caller_identity
* run ./update.sh now and then to see updates
