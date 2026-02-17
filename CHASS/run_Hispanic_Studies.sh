#!/bin/bash
#SBATCH --job-name=Hispanic_Studies
#SBATCH --output=Hispanic_Studies.out
#SBATCH --error=Hispanic_Studies.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Hispanic_Studies (CHASS)"
python3 -c "print('Analyzing Cervantes text...'); import time; time.sleep(5); print('Analysis complete.')"
echo "Job finished successfully"
