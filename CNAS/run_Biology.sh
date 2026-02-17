#!/bin/bash
#SBATCH --job-name=Biology
#SBATCH --output=Biology.out
#SBATCH --error=Biology.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Biology (CNAS)"
python3 -c "print('Aligning gene sequences...'); import time; time.sleep(5); print('Alignment score: 98%.')"
echo "Job finished successfully"
