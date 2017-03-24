#!/bin/sh
#
# Sanitize the files in the "how-do-i" direcotry for 

###############################################################################
# Convert filename to lowercase letters for files in current directory
# Arguments:
# 	None
# Returns:
#	None
###############################################################################
lowercase_all_files() {
	rename -f 'y/A-Z/a-z/' *
}

###############################################################################
# Replace all spaces with hyphens for files in current directory
# Arguments:
# 	None
# Returns:
#	None
###############################################################################
replace_spaces_with_hyphen() {
	rename "s/ /-/g" *
}

###############################################################################
# Main
# Arguments:
# 	None
# Returns:
#	None
###############################################################################
main() {
  pushd "content"
    pushd "how-do-i"
      lowercase_all_files
      replace_spaces_with_hyphen
    popd
  popd
}

main
