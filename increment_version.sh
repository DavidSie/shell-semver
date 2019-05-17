#!/bin/bash

# Increment a version string using Semantic Versioning (SemVer) terminology.

# Parse command line options.

while getopts ":Mmpr" Option
do
  case $Option in
    M ) major=true;;
    m ) minor=true;;
    p ) patch=true;;
    r ) rc=true;;
  esac
done

shift $(($OPTIND - 1))

version=$1

# Build array from version string.

a=( ${version//./ } )

# If version string is missing or has the wrong number of members, show usage message.

if [ ${#a[@]} -ne 3 ]
then
  echo "usage: $(basename $0) [-Mmp] major.minor.patch[-rc'rc']"
  exit 1
fi

# Increment version numbers as requested.

if [ ! -z $major ]
then
  ((a[0]++))
  a[1]=0
  a[2]=0
fi

if [ ! -z $minor ]
then
  ((a[1]++))
  a[2]=0
fi

if [ ! -z $patch ]
then
  ((a[2]++))
fi

if [ ! -z $rc ]
then
  b=( ${a[2]//-rc/ } )
  ((b[1]++))
  echo "${a[0]}.${a[1]}.${b[0]}-rc${b[1]}"
  exit 0
fi

echo "${a[0]}.${a[1]}.${a[2]}"
