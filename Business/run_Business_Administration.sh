#!/bin/bash
#SBATCH --job-name=Business_Administration
#SBATCH --output=Business_Administration.out
#SBATCH --error=Business_Administration.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Business_Administration (Business)"
python3 -c "print('Predicting stock trends...'); import time; time.sleep(5); print('Buy signal generated.')"
echo "Job finished successfully"
