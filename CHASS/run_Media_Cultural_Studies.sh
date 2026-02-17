#!/bin/bash
#SBATCH --job-name=Media_Cultural_Studies
#SBATCH --output=Media_Cultural_Studies.out
#SBATCH --error=Media_Cultural_Studies.err
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

echo "Starting job for Media_Cultural_Studies (CHASS)"
python3 -c "print('Scraping social media trends...'); import time; time.sleep(5); print('Trends identified.')"
echo "Job finished successfully"
