pops=BB\ VB\ PB\ SJ\ BNP\ GB\ SP
popfile=/data/oziolore/fhet/data/list2/pop_samples

for i in {1..7}
	do grep -n $pops $popfile | cut -f 1 -d ":" | awk '{s=$1-1}{print s}' | tr '\n' ',' | sed 's/,$//' | tr ',' '\n' | shuf -n 24 | sort | tr '\n' ',' | sed 's/,$//' > /data/oziolore/fhet/data/list2/BB_sub.txt

