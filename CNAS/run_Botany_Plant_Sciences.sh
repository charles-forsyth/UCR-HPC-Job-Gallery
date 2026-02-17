#!/bin/bash
#SBATCH --job-name=Botany_Plant_Sciences
#SBATCH --output=Botany_Plant_Sciences.out
#SBATCH --error=Botany_Plant_Sciences.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Botany_Plant_Sciences (CNAS)"
python3 -c "print('Simulating photosynthesis efficiency...'); import time; time.sleep(5); print('Growth rate calculated.')"
echo "Job finished successfully"
