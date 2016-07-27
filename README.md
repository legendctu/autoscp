# autoscp
fetch files automatically by using scp

## Usage
```shell
/bin/sh fetch.sh <pwd_file> <targets_file>
```

### Format

#### pwd_file

```
ip user port password (and anything else, but the script won't care)
```

Caution: the password CAN'T have any spaces in it.

For example:
```
192.168.1.1 root 22 123 copy
192.168.1.2 guest 23 p@ssw0rd
```

#### targets_file

```
/path/to/file1
/path/to/file2
```
