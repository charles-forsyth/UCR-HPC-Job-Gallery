#!/bin/bash
#SBATCH --job-name=Environmental_Sciences
#SBATCH --output=Environmental_Sciences.out
#SBATCH --error=Environmental_Sciences.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Environmental_Sciences (CNAS)"
python3 -c "print('Analyzing air quality data...'); import time; time.sleep(5); print('AQI calculated.')"
echo "Job finished successfully"
