#! /bin/bash

echo a b c some tokens
echo \a \b \c backslash is no-op if not recognized
echo \\ escape backslash with itself
echo \
newline escaped

echo 'everything but single quote ~`!@#$%^&*()-_=+[{]}\|;:",<.>/? incl double quote'
echo 'cannot escape single quote inside single quotes '\'' so exit and reenter quotes'
echo "single within double ' "
echo "double within double \" that's easy"
echo "single withing double unnecessary escape \' just prints both characters"
echo 'home is not $HOME -- not vars not resolved in single quotes'
echo "home is $HOME -- vars resolved in double quotes"
echo 'wd is not `pwd` -- backticks not resolved in single quotes'
echo "wd is `pwd` -- backticks resolved in double quotes"
echo 'wd is not $(pwd) -- because dollar-paren is a variable'
echo "wd is $(pwd) -- dollar-paren resolves in double quotes"

# to pass $2 to awk by resoving COLNO,
# either step out of single quotes to eval COLNO
# or use double quotes and escape first $ 
COLNO=2
set -x
# -e is required for multi-line treatment
echo -e " wrong right wrong2 wrong3 \n wrong4 right2 wrong5 wrong6 " | awk '{print $'$COLNO'}'
echo -e " wrong right wrong2 wrong3 \n wrong4 right2 wrong5 wrong6 " | awk "{print \$$COLNO}"

# this causes EOF error echo "
# this causes EOF error echo '


