#!/bin/bash
#SBATCH --job-name=Computer_Science
#SBATCH --output=Computer_Science.out
#SBATCH --error=Computer_Science.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Computer_Science (BCOE)"
python3 -c "print('Sorting large array...'); arr=list(range(10000)); arr.reverse(); arr.sort(); print('Sort complete.')"
echo "Job finished successfully"
