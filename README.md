# AutoDock Vina (6 sig figs) protrocol
## 1. Convert receptor from pdb to pdbqt file using ADFR suite

  - ADFR suite is the new version of MGL tools. We will only use the “prepare receptor” function of ADFR suite.
  https://ccsb.scripps.edu/adfr/downloads/
  
 ```
 $ ADFRsuite_x86_64Linux_1.0/bin/prepare_receptor -r receptor.pdb
  ```
  
  - **Avoid using absolute path for ADFRsuite**
  - **Remove waters, ligands, cofactors, and ions unnecessary for the docking before converting it to pdbqt file.**

## 2. Convert ligands from sdf to pdbqt file using Meeko

- Meeko can covert sdf files to pdbqt files, which is not included in the ADFR suite.
- https://github.com/forlilab/Meeko
```
$ mk_prepare_ligand.py -i ligand.sdf -o ligand.pdbqt --add_hydrogen --pH 7.4
```
- **Please do not use pdb format for ligands since it does not contain all information needed for docking.**

## 3. Run AutoDock Vina

- The regular version of AutoDock Vina only returns 4 significant figures of the binding score, if you want more sig figs, please use the 6 sig figs version.
- 4 sig figs: https://github.com/ccsb-scripps/AutoDock-Vina/releases
- 6 sig figs: https://github.com/diogomart/AutoDock-Vina/releases/tag/six_sigfigs
- To get started, 
```
$ vina --help or $ vina --help_advanced
```
- Actual docking command:
```
$ vina --receptor receptor.pdbqt --ligand ligand.pdbqt --config config.txt --cpu 4 --out docked_ligand.pdbqt > output.log
```
- Config.txt should include following information: (detailed info can be found using the help command, but those should be enough)
```
center_x = 
center_y = 
center_z = 
size_x = 
size_y = 
size_z = 

energy_range = 
exhaustiveness = 
num_modes = 
```

## 4. Convert docked poses from pdbqt to pdb
```
$ cut -c-66 docked_ligand.pdbqt > docked_ligand.pdb
```

Good luck :)


