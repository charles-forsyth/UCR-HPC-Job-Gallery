#!/bin/bash
#SBATCH --job-name=Earth_Planetary_Sciences
#SBATCH --output=Earth_Planetary_Sciences.out
#SBATCH --error=Earth_Planetary_Sciences.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Earth_Planetary_Sciences (CNAS)"
python3 -c "print('Processing seismic waves...'); import time; time.sleep(5); print('Epicenter localized.')"
echo "Job finished successfully"
