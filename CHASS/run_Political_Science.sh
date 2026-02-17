#!/bin/bash
#SBATCH --job-name=Political_Science
#SBATCH --output=Political_Science.out
#SBATCH --error=Political_Science.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Political_Science (CHASS)"
python3 -c "print('Simulating voting patterns...'); import time; time.sleep(5); print('Election simulated.')"
echo "Job finished successfully"
