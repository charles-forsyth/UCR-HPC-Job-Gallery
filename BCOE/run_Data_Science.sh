#!/bin/bash
#SBATCH --job-name=Data_Science
#SBATCH --output=Data_Science.out
#SBATCH --error=Data_Science.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Data_Science (BCOE)"
python3 -c "print('Training neural net...'); import time; time.sleep(5); print('Loss minimized.')"
echo "Job finished successfully"
