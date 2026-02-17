#!/bin/bash
#SBATCH --job-name=Microbiology_Plant_Pathology
#SBATCH --output=Microbiology_Plant_Pathology.out
#SBATCH --error=Microbiology_Plant_Pathology.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Microbiology_Plant_Pathology (CNAS)"
python3 -c "print('Simulating viral spread...'); import time; time.sleep(5); print('R0 estimated.')"
echo "Job finished successfully"
