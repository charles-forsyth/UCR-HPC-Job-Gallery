#!/bin/bash
#SBATCH --job-name=Bioengineering
#SBATCH --output=Bioengineering.out
#SBATCH --error=Bioengineering.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Bioengineering (BCOE)"
python3 -c "print('Modeling tissue scaffold...'); import time; time.sleep(5); print('Scaffold design valid.')"
echo "Job finished successfully"
