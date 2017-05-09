
This is a repo for building docker on ppc64le. To add in a new
distro or add a new docker version, change the corresponding 
variables in generate.sh and run it, which will create the dir.

## Branches > Docker v17.03 on ppc64le are equivalent to upstream release


## Branch for Docker v1.13.x on ppc64le is equivalent to upstream release


## Branch for Docker v1.12.x with cherry-picks for making debs

the following three patches are cherry-picked into the 
corresponding release branch

``#64881dc331f1f0ff861eb82bb05eef63d6693a67
ppc64le: add support for building docker debs for xenial``


``#af3d66c2c0de3269a3384c6ab92906d38b437059
added ubuntu-trusty``


``#da382044d3630bcdeb1eac64f2f7ad476e0cf007
[ppc64le] add yakkety yak to 'make deb'``





