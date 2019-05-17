bash-semver
===========

Increment semantic versioning strings in shell scripts.

```shell
$ ./increment_version.sh
usage: increment_version.sh [-Mmp] major.minor.patch

$ ./increment_version.sh -p 0.0.0
0.0.1

$ ./increment_version.sh -m 0.0.3
0.1.0

$ ./increment_version.sh -M 1.1.15
2.0.0

$ ./increment_version.sh -Mmp 2.3.4
3.1.1

$ ./increment_version.sh -r 1.2.2-rc1
1.2.2-rc2
```

## Testing ##

### step 1 ###
install bats

### step 2 ###
```bash
chmod +x increment_version.sh
bats bats_test.sh
```
