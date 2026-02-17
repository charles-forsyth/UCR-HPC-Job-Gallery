#!/bin/bash
#SBATCH --job-name=Creative_Writing
#SBATCH --output=Creative_Writing.out
#SBATCH --error=Creative_Writing.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Creative_Writing (CHASS)"
python3 -c "print('Generating narrative structures...'); import time; time.sleep(5); print('Draft complete.')"
echo "Job finished successfully"
