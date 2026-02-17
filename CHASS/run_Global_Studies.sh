#!/bin/bash
#SBATCH --job-name=Global_Studies
#SBATCH --output=Global_Studies.out
#SBATCH --error=Global_Studies.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Global_Studies (CHASS)"
python3 -c "print('Mapping geopolitical data...'); import time; time.sleep(5); print('Map generated.')"
echo "Job finished successfully"
