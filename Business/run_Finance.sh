#!/bin/bash
#SBATCH --job-name=Finance
#SBATCH --output=Finance.out
#SBATCH --error=Finance.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Finance (Business)"
python3 -c "print('Pricing options...'); import time; time.sleep(5); print('Black-Scholes calculated.')"
echo "Job finished successfully"
