#!/bin/bash
#SBATCH --job-name=Nematology
#SBATCH --output=Nematology.out
#SBATCH --error=Nematology.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Nematology (CNAS)"
python3 -c "print('Analyzing soil samples...'); import time; time.sleep(5); print('Nematode count: High.')"
echo "Job finished successfully"
