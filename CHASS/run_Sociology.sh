#!/bin/bash
#SBATCH --job-name=Sociology
#SBATCH --output=Sociology.out
#SBATCH --error=Sociology.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Sociology (CHASS)"
python3 -c "print('Mapping social networks...'); import time; time.sleep(5); print('Network graph built.')"
echo "Job finished successfully"
