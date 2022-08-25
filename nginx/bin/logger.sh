thePath="$(realpath $(dirname $0)/..)"
logBase=$thePath/log
awkExpr='{printf("\n%s\n%s\n%s\n%s\n"),$4,$2,$6,$14}'

if [[ $1 = -f ]]; then
    tail -f $logBase/visit.log | awk -F "[][]" ${awkExpr}
elif [[ -n $1 ]]; then
    find $logBase -name *visit.log | sort | tail -$1 | xargs cat | awk -F "[][]" ${awkExpr}
fi
