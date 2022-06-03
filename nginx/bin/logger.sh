thePath="$(realpath $(dirname $0)/..)"
logBase=$thePath/log
awkExpr='{printf("\n%s\n%s\n%s\n%s\n"),$4,$2,$6,$14}'

if [[ $1 = -f ]]; then
    tail -f $logBase/visit.log | awk -F "[][]" ${awkExpr}
else
    awk -F "[][]" ${awkExpr} $logBase/visit.log
fi
