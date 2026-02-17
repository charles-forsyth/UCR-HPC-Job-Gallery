#!/bin/bash
#SBATCH --job-name=Chemistry
#SBATCH --output=Chemistry.out
#SBATCH --error=Chemistry.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Chemistry (CNAS)"
python3 -c "print('Calculating reaction energy...'); import time; time.sleep(5); print('Exothermic reaction confirmed.')"
echo "Job finished successfully"
