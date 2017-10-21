 echo "id chr pos name A0_freq A1 K1 K2" > refPanel_BBGB.2.P.txt
 paste -d" " <( awk -F " " ' { print $1"_"$4, $1, $4, $2, $6, $5 } ' /data/oziolore/fhet/data/fastngs/reference_panel.bim ) reference_panel.2.P >> refPanel_BBGB.2.P.txt
 echo "K1 K2" > nInd_BBGB.2.Q.txt
 paste -d" " <(cut -f1 -d" " /data/oziolore/fhet/data/fastngs/reference_panel.2.Q | paste -sd+ | bc) <(cut -f2 -d" " /data/oziolore/fhet/data/fastngs/reference_panel.2.Q | paste -sd+ | bc) >> nInd_BBGB.2.Q.txt
