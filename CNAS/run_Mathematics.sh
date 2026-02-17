#!/bin/bash
#SBATCH --job-name=Mathematics
#SBATCH --output=Mathematics.out
#SBATCH --error=Mathematics.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Mathematics (CNAS)"
python3 -c "print('Calculating primes...'); p=[x for x in range(2, 1000) if all(x%y!=0 for y in range(2, int(x**.5)+1))]; print(f'Found {len(p)} primes.')"
echo "Job finished successfully"
