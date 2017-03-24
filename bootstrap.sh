#!/bin/sh
#
# Bootstrap the documentation directory with official git documentation from
# kernel.org: https://www.kernel.org/pub/software/scm/git

# Constants
export readonly DO_NOT_MANUALLY_EDIT_WARN="<!-- Do not manually edit - This file is generated with bootstrap.sh -->"
export readonly HTML_DOCS_PREFIX="git-htmldocs-"
export readonly HTML_DOCS_VERSION_SUFFIX=".md"
export readonly DOCS_DIRECTORY="documentation"
export readonly DOCS_FILE="_index.md"

###############################################################################
# Create front matter for documentation file
# Arguments:
#   None
# Returns:
#   None
###############################################################################
create_documentation_front_matter() {
  echo "---" > $DOCS_FILE
  echo "Title: \"Documentation\"" >> $DOCS_FILE
  echo "Description: \"Documentation\"" >> $DOCS_FILE
  echo "---" >> $DOCS_FILE
  echo "" >> $DOCS_FILE
  echo $DO_NOT_MANUALLY_EDIT_WARN >> $DOCS_FILE
}
export -f create_documentation_front_matter

###############################################################################
# Create front matter for specific git version documentaiton file
# Arguments:
#   ${1} - directory of the current git version docs (e.g. `2.0.0`)
# Returns:
#   None
###############################################################################
create_git_version_front_matter() {
  versionFile="${1}${HTML_DOCS_VERSION_SUFFIX}"

  echo "---" > $versionFile
  echo "Title: \"$1\"" >> $versionFile
  echo "Description: \"$1\"" >> $versionFile
  echo "---" >> $versionFile
  echo "" >> $versionFile
  echo $DO_NOT_MANUALLY_EDIT_WARN >> $versionFile
}
export -f create_git_version_front_matter

###############################################################################
# Fix relaitve paths in each markdown file
# Arguments:
#   ${1} - markdown file to update relative links (e.g. `git-add.md`)
# Returns:
#   None
###############################################################################
fix_relative_hyper_links () {
  markdownFile="${1}"
  sed -i -e 's/.html)/)/g' $markdownFile          
  sed -i -e 's/)](/)](..\//g' $markdownFile  
}
export -f fix_relative_hyper_links

###############################################################################
# Extract and format documentation for site
# Arguments:
#   ${1} - documentation zip file name (e.g. `git-htmldocs-2.0.0.tar.gz`)
# Returns:
#   None
###############################################################################
extract_documentation() {
  docsZipFile="${1}"

  directory=`basename ${docsZipFile} .tar.gz`
  versionDirectory=${directory#$HTML_DOCS_PREFIX}

  mkdir "${versionDirectory}" &>/dev/null

  echo "- [${versionDirectory}](/$DOCS_DIRECTORY/${versionDirectory})" >> "${DOCS_FILE}"
  create_git_version_front_matter "${versionDirectory}"

  pushd $versionDirectory &>/dev/null

    tar xzf ../${docsZipFile}

    # Remove All Directories
    find . -mindepth 1 -maxdepth 1 -type d -print0 | xargs -0 rm -R

    # Remove All Symlinks
    find . -maxdepth 1 -type l -exec rm -f {} \;

    # Remove All Non HTML files
    find . ! -name '*.html' -type f -exec rm -f {} +

    # Modify HTML
    for htmlFile in *.html; do
      htmlFileBase=${htmlFile##*/}
      htmlFilePrefix=${htmlFileBase%.*}

      # Extract command description
      commandDescription=`hxnormalize -x ${htmlFile} | hxselect -c "div#header p" | awk '{split($0,a," - "); print a[2]}'`

      if [[ -z "$commandDescription" ]]; then
        commandDescription=`hxnormalize -x ${htmlFile}  | hxselect -i -s '\n' -c  'title'`
      fi

      echo "- [${htmlFilePrefix}](/$DOCS_DIRECTORY/${versionDirectory}/${htmlFilePrefix}) - ${commandDescription}" >> "../${versionDirectory}${HTML_DOCS_VERSION_SUFFIX}"

      markdownFile="${htmlFilePrefix}.md"

      # Insert front mmatter
      frontMatter="---\ntitle: \"${htmlFilePrefix}\"\ndescription: \"${commandDescription}\"\n---\n${DO_NOT_MANUALLY_EDIT_WARN}"
      echo $frontMatter > $markdownFile

      hxnormalize -x ${htmlFile}  | hxselect -c "div#content" | pandoc -f html -t markdown_github >> $markdownFile

      export -f fix_relative_hyper_links
      fix_relative_hyper_links $markdownFile
      rm $htmlFile
    done

  popd &>/dev/null
}
export -f extract_documentation

###############################################################################
# This function creates as many threads as  your cpu has in order to quickly
#   bootstrap all of the documentation.
# Arguments:
#   None
# Returns:
#   None
###############################################################################
main() {
  pushd content
  pushd ${DOCS_DIRECTORY}

    create_documentation_front_matter

    # Production
    rsync -a --include="git-htmldocs-[0-9].[0-9].[0-9].tar.gz" --exclude="*" rsync://rsync.kernel.org/pub/software/scm/git/ . &>/dev/null

    # Test
    # rsync -a --include="git-htmldocs-1.8.[0-9].tar.gz" --exclude="*" rsync://rsync.kernel.org/pub/software/scm/git/ . &>/dev/null
    ls -1r *.tar.gz | parallel -j`sysctl -n hw.ncpu` extract_documentation

    # rm *.tar.gz
  popd
  popd
}

main
