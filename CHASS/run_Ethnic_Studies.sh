#!/bin/bash
#SBATCH --job-name=Ethnic_Studies
#SBATCH --output=Ethnic_Studies.out
#SBATCH --error=Ethnic_Studies.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Ethnic_Studies (CHASS)"
python3 -c "print('Analyzing demographic shifts...'); import time; time.sleep(5); print('Data processed.')"
echo "Job finished successfully"
