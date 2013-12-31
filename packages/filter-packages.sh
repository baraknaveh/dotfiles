#!/bin/bash
#
# Select tools from the tool repository using the specified list of tags.
# The tools selected are tagged with ALL the specified tags (AND relation).
#

ME="$0"
MY_DIR=$(cd "$(dirname "$ME")"; pwd)
REPO="$MY_DIR/tools.cfg"

if [ $# -eq 0 ]
then
        echo "Usage: `basename \"$ME\"` <tag> [<tag> ...]" >&2
        exit 1;
fi

# Build a filter to canonicalize spaces and remove comments and empty lines
filter="expand -1 | sed 's/ +/ /g' | sed 's/^ //' | grep -v '^#' | grep -v '^\$' "

# Filter further using caller-specified tags
for tag in $@
do
        filter="$filter | grep \" $tag\""
done

# Execute the filter and trip spaces from the result
bash -c "cat \"$REPO\" | $filter | sed 's/ .*//'"
