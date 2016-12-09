#!/bin/bash - 
#===============================================================================
#
#          FILE: build.sh
# 
#         USAGE: ./build.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2016/12/09 16:09
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


hexo generate
hexo deploy
git add .
git ci -m "tmp ci"
git push


