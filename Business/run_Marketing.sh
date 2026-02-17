#!/bin/bash
#SBATCH --job-name=Marketing
#SBATCH --output=Marketing.out
#SBATCH --error=Marketing.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Marketing (Business)"
python3 -c "print('Segmenting customers...'); import time; time.sleep(5); print('Segments defined.')"
echo "Job finished successfully"
