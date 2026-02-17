#!/bin/bash
#SBATCH --job-name=Biochemistry
#SBATCH --output=Biochemistry.out
#SBATCH --error=Biochemistry.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Biochemistry (CNAS)"
python3 -c "print('Folding proteins...'); import time; time.sleep(5); print('Structure stabilized.')"
echo "Job finished successfully"
