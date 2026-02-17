#!/bin/bash
#SBATCH --job-name=Management
#SBATCH --output=Management.out
#SBATCH --error=Management.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Management (Business)"
python3 -c "print('Optimizing supply chain...'); import time; time.sleep(5); print('Logistics streamlined.')"
echo "Job finished successfully"
