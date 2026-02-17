#!/bin/bash
#SBATCH --job-name=Comparative_Literature
#SBATCH --output=Comparative_Literature.out
#SBATCH --error=Comparative_Literature.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Comparative_Literature (CHASS)"
python3 -c "print('Comparing literary texts...'); import time; time.sleep(5); print('Comparison complete.')"
echo "Job finished successfully"
