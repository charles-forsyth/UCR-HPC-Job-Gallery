#!/bin/bash
#SBATCH --job-name=Chemical_Environmental_Engineering
#SBATCH --output=Chemical_Environmental_Engineering.out
#SBATCH --error=Chemical_Environmental_Engineering.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Chemical_Environmental_Engineering (BCOE)"
python3 -c "print('Simulating chemical reactor...'); import time; time.sleep(5); print('Yield optimized.')"
echo "Job finished successfully"
