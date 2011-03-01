#!/bin/bash

# find tags file in all parent dirs
prjdir=`pwd`
while [ "$prjdir" != "" ]; do
  if [ -f "$prjdir"/tags ]; then
    update "$prjdir"
    break
  fi
  prjdir=${prjdir%/*}
done

# update if found
if [ "$prjdir" != "" ]; then
  echo "Updating $prjdir/tags"
  ctags -f "$prjdir/tags" -R "$prjdir"
else
  echo "No tags file found, generate one with ctags -R ." >&2
fi
