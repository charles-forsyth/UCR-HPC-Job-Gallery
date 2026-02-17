#!/bin/bash
#SBATCH --job-name=Materials_Science_Engineering
#SBATCH --output=Materials_Science_Engineering.out
#SBATCH --error=Materials_Science_Engineering.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Materials_Science_Engineering (BCOE)"
python3 -c "print('Analyzing crystal lattice...'); import time; time.sleep(5); print('Structure identified.')"
echo "Job finished successfully"
