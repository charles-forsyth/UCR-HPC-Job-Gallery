#!/bin/bash
#SBATCH --job-name=Statistics
#SBATCH --output=Statistics.out
#SBATCH --error=Statistics.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Statistics (CNAS)"
python3 -c "print('Running Monte Carlo simulation...'); import random; res=[random.random() for _ in range(1000)]; print('Simulation done.')"
echo "Job finished successfully"
