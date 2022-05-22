mkdir -p  ../lig_pdbqt ../rec_pdbqt ../docked_pdbqt ../docked_pdb ../score_only_log ../score_only ../log

vina="/data/homezvol0/weimind/downloads/vina_linux_x86_64"
ADFRSuite="/data/homezvol0/weimind/downloads/ADFRsuite_x86_64Linux_1.0"

for i in $(seq 0 55)
do
	echo $i

  #running vina
  $vina --receptor ../rec_pdbqt/receptor.pdbqt --ligand ../lig_pdbqt/${i}.pdbqt --config ../config.txt --cpu 4 --out ../docked_pdbqt/${i}_docked.pdbqt > ${i}.log
	mv ${i}.log ../log

  #convert pdbqt to pdb
  cut -c-66 ../docked_pdbqt/${i}_docked.pdbqt > ../docked_pdb/${i}_docked.pdb

done


