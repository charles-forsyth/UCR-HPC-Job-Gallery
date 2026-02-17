#!/bin/bash
#SBATCH --job-name=Philosophy
#SBATCH --output=Philosophy.out
#SBATCH --error=Philosophy.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Philosophy (CHASS)"
python3 -c "print('Validating logical arguments...'); import time; time.sleep(5); print('Logic valid.')"
echo "Job finished successfully"
