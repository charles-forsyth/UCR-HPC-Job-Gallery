#!/bin/bash
#SBATCH --job-name=Anthropology
#SBATCH --output=Anthropology.out
#SBATCH --error=Anthropology.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Anthropology (CHASS)"
python3 -c "print('Analyzing cultural artifacts...'); import time; time.sleep(5); print('Analysis complete.')"
echo "Job finished successfully"
