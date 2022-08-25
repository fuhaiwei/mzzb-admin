### List User Agent
```bash
grep UA -r ~/mzzb-admin/nginx/log/backup | awk -F "[][]" '{printf("\n%s\n%s\n%s\n%s\n"),$4,$2,$6,$14}' | grep UA | sort | uniq | less
```

### Count Week Path
```base
bash bin/logger.sh 7 | grep Path | awk '{print $2 " " $3}' | grep /api | sort | uniq -c | sort --human-numeric-sort | less
```
