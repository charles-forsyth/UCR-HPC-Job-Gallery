#!/bin/bash
#SBATCH --job-name=Theatre_Film_Digital_Production
#SBATCH --output=Theatre_Film_Digital_Production.out
#SBATCH --error=Theatre_Film_Digital_Production.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Theatre_Film_Digital_Production (CHASS)"
python3 -c "print('Rendering video frames...'); import time; time.sleep(5); print('Render finished.')"
echo "Job finished successfully"
