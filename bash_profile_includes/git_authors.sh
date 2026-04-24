git-authors () {
        git authors -e | rg '\s*(\d+)\s+.*<(.*)>' -r '$1,$2' | awk -F, '{ Authors[$2]+=$1 } END { for (author in Authors) { print author","Authors[author] } }' | sort -t, -nk2 | termgraph --color=blue
}
