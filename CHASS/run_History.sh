#!/bin/bash
#SBATCH --job-name=History
#SBATCH --output=History.out
#SBATCH --error=History.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for History (CHASS)"
python3 -c "print('Simulating historical timelines...'); import time; time.sleep(5); print('Timeline generated.')"
echo "Job finished successfully"
