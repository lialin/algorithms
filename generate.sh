#!/bin/bash

#------------------------------------------------------------------------------
# This script generates banner tempales
#
# Liang Lin
#------------------------------------------------------------------------------
MLFILE=algo.sml
LHSFILE=algo.lhs
PYFILE=algo.py
README=readme.md

exec 3>&1           # write to output file.
exec > /dev/stderr  # Redirect current stdout to stderr

# get_template() {
#     case ${!1} in
#     m)  eval $1="algo.ml";            return 0;;
#     h)  eval $1="algo.lhs";           return 0;;
#     p)  eval $1="algo.py";            return 0;;
#     *)  return 1;;
#     esac
# }

ask() {
    local i=$((54 - ${#1}))
    local p
    printf -v p "%*s" $i
    echo -n "${1}${p// /.}: "
}

year=$(date +%Y)
now=$(date +%Y-%m-%d)
#author=$(awk -F: 'user == $1 {print $5}' user=$USER /etc/passwd)
author=$(git config --get user.name 2> /dev/null)
copyright="$author"
def_email=$(git config --get user.email 2> /dev/null)
tabwidth=4

while getopts 'hf:e:c:o:w:' OPTION ; do
    case $OPTION in
    c)  [ -n "$OPTARG" ] && copyright="$OPTARG"
        copyrt=1;;
    e)  email="$OPTARG";;
    # t)  template="$OPTARG"
		# get_template template
    #     if [ $? -ne 0 ]; then
    #        echo "Invalid template type: $template"
    #        exit 1
    #     fi;;
    o)  # Redirect output to file
        [ -d "$OPTARG" ] || (echo "$OPTARG directory doesn't exist!"  && exit 1)
        outdir="$OPTARG"
        ;;
    w)  tabwidth=$OPTARG
        [ $tabwidth -eq 2 -o $tabwidth -eq 4 ] || (echo "Tabwidth must be 2 or 4!" && exit 1);;

    *)  echo "This script creates generic algorithm files from templates."
        echo
        echo "Usage: $0 [-f Function]"
        echo "          [-c Copyright] [-o OutputDir] [-w TabWidth]"
        # echo "  Type        - m  = Standard ML"
        # echo "                h  = Literate Haskell"
        # echo "                p  = Python"
        echo "  OutputDir   - when provided, output is redirected to "
        echo "                OutputDir/file'"
        exit 1;;
    esac
done

# while [ -z "$template" ]; do
#     echo "Create a algorithm template in [standard (m)l), literate (h)askell,"
#     ask  "                               (p)ython"
#     read template && get_template template && break
#     unset template
# done

while [ -z "$email" ]; do
    if [ -n "$def_email" ]; then
        m=" [default: $def_email]"
    fi
    ask "Email address${m}"
    read email && [ -n "$email" ] && break || email="$def_email"
done

while [ -z "$fun" ]; do
    if [ -n "$def_fun" ]; then
        m=" [default: $def_fun]"
    fi
    ask "function name:"
    read fun && [ -n "$fun" ] && break || fun="$def_email"
done

#----------------------------------------
# Standard ML
#----------------------------------------

if [ -n "$outdir" ]; then
    mlfile="$outdir/$fun.sml"
    echo "Creating files..."
    exec > "$mlfile" || exit 1
else
    exec 1>&3   # Restore old file descriptor
fi

dir=$PWD
sed -e "s!%AUTHOR%!${author}!g" \
    -e "s!%DATE%!${now}!g" \
    -e "s!%EMAIL%!${email}!g" \
    -e "s!%FUN%!${fun}!g" \
    ${dir}/${MLFILE}.in

#----------------------------------------
# Literate Haskell
#----------------------------------------
if [ -n "$outdir" ]; then
    lhsfile="$outdir/$fun.lhs"
    exec > "$lhsfile" || exit 1
else
    exec 1>&3   # Restore old file descriptor
fi
module="$(tr '[:lower:]' '[:upper:]' <<< ${fun:0:1})${fun:1}"
sed -e "s!%AUTHOR%!${author}!g" \
    -e "s!%DATE%!${now}!g" \
    -e "s!%EMAIL%!${email}!g" \
    -e "s!%FUN%!${fun}!g" \
    -e "s!%MODULE%!${module}!g" \
    ${dir}/${LHSFILE}.in

#----------------------------------------
# Python
#----------------------------------------
if [ -n "$outdir" ]; then
    pyfile="$outdir/$fun.py"
    exec > "$pyfile" || exit 1
else
    exec 1>&3   # Restore old file descriptor
fi

sed -e "s!%AUTHOR%!${author}!g" \
    -e "s!%DATE%!${now}!g" \
    -e "s!%EMAIL%!${email}!g" \
    -e "s!%FUN%!${fun}!g" \
    ${dir}/${PYFILE}.in

#----------------------------------------
# Readme
#----------------------------------------
if [ -n "$outdir" ]; then
    readme="$outdir/$README"
    exec > "$readme" || exit 1
else
    exec 1>&3   # Restore old file descriptor
fi

sed -e "s!%TITLE%!${outdir}!g" \
    ${dir}/${README}.in

exec 1>&3 3>&-       # Restore stout

echo "done"

if [ -n "$outdir" ]; then
    echo "git add $outdir files"
    git add $outdir
    echo "git commit $outdir"
    git commit -m "add $outdir files" $outdir
    echo "git push"
    git push
else
    exec 1>&7
fi
