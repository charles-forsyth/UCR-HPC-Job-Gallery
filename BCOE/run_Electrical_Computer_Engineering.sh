#!/bin/bash
#SBATCH --job-name=Electrical_Computer_Engineering
#SBATCH --output=Electrical_Computer_Engineering.out
#SBATCH --error=Electrical_Computer_Engineering.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Electrical_Computer_Engineering (BCOE)"
python3 -c "print('Computing FFT...'); import time; time.sleep(5); print('Frequency domain analyzed.')"
echo "Job finished successfully"
