#!/bin/bash
#SBATCH --job-name=Economics
#SBATCH --output=Economics.out
#SBATCH --error=Economics.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Economics (CHASS)"
python3 -c "print('Running econometric models...'); import time; time.sleep(5); print('Forecast generated.')"
echo "Job finished successfully"
