#!/bin/bash
#SBATCH --job-name=Gender_Studies
#SBATCH --output=Gender_Studies.out
#SBATCH --error=Gender_Studies.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Gender_Studies (CHASS)"
python3 -c "print('Processing survey responses...'); import time; time.sleep(5); print('Survey analysis complete.')"
echo "Job finished successfully"
