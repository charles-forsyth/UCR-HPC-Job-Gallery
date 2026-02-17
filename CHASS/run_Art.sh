#!/bin/bash
#SBATCH --job-name=Art
#SBATCH --output=Art.out
#SBATCH --error=Art.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Art (CHASS)"
python3 -c "print('Processing digital assets...'); import time; time.sleep(5); print('Rendering complete.')"
echo "Job finished successfully"
