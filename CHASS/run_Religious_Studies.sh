#!/bin/bash
#SBATCH --job-name=Religious_Studies
#SBATCH --output=Religious_Studies.out
#SBATCH --error=Religious_Studies.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Religious_Studies (CHASS)"
python3 -c "print('Comparing sacred texts...'); import time; time.sleep(5); print('Comparison finished.')"
echo "Job finished successfully"
