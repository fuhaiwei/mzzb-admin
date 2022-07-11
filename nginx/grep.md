### List User Agent
```bash
grep UA -r ~/mzzb-admin/nginx/log/backup | awk -F "[][]" '{printf("\n%s\n%s\n%s\n%s\n"),$4,$2,$6,$14}' | grep UA | sort | uniq > ~/ua
```
