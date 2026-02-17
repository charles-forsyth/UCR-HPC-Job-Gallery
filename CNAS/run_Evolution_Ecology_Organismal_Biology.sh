#!/bin/bash
#SBATCH --job-name=Evolution_Ecology_Organismal_Biology
#SBATCH --output=Evolution_Ecology_Organismal_Biology.out
#SBATCH --error=Evolution_Ecology_Organismal_Biology.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Evolution_Ecology_Organismal_Biology (CNAS)"
python3 -c "print('Building phylogenetic tree...'); import time; time.sleep(5); print('Tree constructed.')"
echo "Job finished successfully"
