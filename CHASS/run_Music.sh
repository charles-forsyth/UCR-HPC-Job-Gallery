#!/bin/bash
#SBATCH --job-name=Music
#SBATCH --output=Music.out
#SBATCH --error=Music.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Music (CHASS)"
python3 -c "print('Processing audio signals...'); import time; time.sleep(5); print('Signal filtered.')"
echo "Job finished successfully"
