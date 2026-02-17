#!/bin/bash
#SBATCH --job-name=Psychology
#SBATCH --output=Psychology.out
#SBATCH --error=Psychology.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Psychology (CHASS)"
python3 -c "print('Running behavioral statistics...'); import time; time.sleep(5); print('P-value calculated.')"
echo "Job finished successfully"
