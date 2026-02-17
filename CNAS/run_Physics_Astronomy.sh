#!/bin/bash
#SBATCH --job-name=Physics_Astronomy
#SBATCH --output=Physics_Astronomy.out
#SBATCH --error=Physics_Astronomy.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Physics_Astronomy (CNAS)"
python3 -c "print('Simulating N-body system...'); import time; time.sleep(5); print('Orbit stable.')"
echo "Job finished successfully"
