#!/bin/bash
#SBATCH --job-name=Education
#SBATCH --output=Education.out
#SBATCH --error=Education.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Education (Education)"
python3 -c "print('Correlating student metrics...'); import time; time.sleep(5); print('Correlation found.')"
echo "Job finished successfully"
