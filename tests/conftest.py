import pytest
import shutil
import tempfile
from pathlib import Path


@pytest.fixture
def temp_workspace():
    """Provides a temporary workspace directory."""
    temp_dir = tempfile.mkdtemp()
    yield Path(temp_dir)
    shutil.rmtree(temp_dir)


@pytest.fixture
def sample_slurm_script_content():
    """Provides sample SLURM script content."""
    return """#!/bin/bash
#SBATCH --job-name=test-job
#SBATCH --output=test-job.out
#SBATCH --error=test-job.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=01:00:00

module load python/3.12
python3 script.py
"""


@pytest.fixture
def sample_python_script_content():
    """Provides sample Python script content."""
    return """import os
print("Hello from Python")
"""
