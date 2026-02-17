#!/bin/bash
#SBATCH --job-name=Dance
#SBATCH --output=Dance.out
#SBATCH --error=Dance.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Dance (CHASS)"
python3 -c "print('Analyzing motion capture data...'); import time; time.sleep(5); print('Motion analysis complete.')"
echo "Job finished successfully"
