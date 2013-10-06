## SSH

- copies `authorized_keys` to be used when logging without password
- PermitRootLogin no
- PasswordAuthentication no (use authorized keys instead)
- ChallengeResponseAuthentication no
- UsePAM no
- change ssh port (see config.sh)
