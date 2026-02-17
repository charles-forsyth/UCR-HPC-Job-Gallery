#!/bin/bash
#SBATCH --job-name=English
#SBATCH --output=English.out
#SBATCH --error=English.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for English (CHASS)"
python3 -c "print('Performing sentiment analysis on Shakespeare...'); import time; time.sleep(5); print('Sentiment: Melancholy.')"
echo "Job finished successfully"
