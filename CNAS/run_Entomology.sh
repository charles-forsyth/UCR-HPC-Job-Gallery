#!/bin/bash
#SBATCH --job-name=Entomology
#SBATCH --output=Entomology.out
#SBATCH --error=Entomology.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Entomology (CNAS)"
python3 -c "print('Modeling insect population...'); import time; time.sleep(5); print('Population stable.')"
echo "Job finished successfully"
