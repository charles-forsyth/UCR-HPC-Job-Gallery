#!/bin/bash
#SBATCH --job-name=Public_Policy
#SBATCH --output=Public_Policy.out
#SBATCH --error=Public_Policy.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Public_Policy (Policy)"
python3 -c "print('Analyzing census data...'); import time; time.sleep(5); print('Policy report generated.')"
echo "Job finished successfully"
