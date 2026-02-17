#!/bin/bash
#SBATCH --job-name=Mechanical_Engineering
#SBATCH --output=Mechanical_Engineering.out
#SBATCH --error=Mechanical_Engineering.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Mechanical_Engineering (BCOE)"
python3 -c "print('Simulating fluid flow (CFD)...'); import time; time.sleep(5); print('Flow converged.')"
echo "Job finished successfully"
