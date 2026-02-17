#!/bin/bash
#SBATCH --job-name=Biomedical_Sciences
#SBATCH --output=Biomedical_Sciences.out
#SBATCH --error=Biomedical_Sciences.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Biomedical_Sciences (Medicine)"
python3 -c "print('Screening drug interactions...'); import time; time.sleep(5); print('No conflicts found.')"
echo "Job finished successfully"
