#!/bin/bash
#SBATCH --job-name=Art_History
#SBATCH --output=Art_History.out
#SBATCH --error=Art_History.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Art_History (CHASS)"
python3 -c "print('Cataloging historical metadata...'); import time; time.sleep(5); print('Cataloging complete.')"
echo "Job finished successfully"
