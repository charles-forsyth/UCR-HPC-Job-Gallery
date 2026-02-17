from pathlib import Path
import pytest
from src.gallery.parser import scan_directory, parse_job_script

def test_scan_directory_finds_scripts(temp_workspace, sample_slurm_script_content):
    """Verify parser can find job scripts in a directory structure."""
    
    # Create mock departmental directories
    bcoe_dir = temp_workspace / "BCOE"
    bcoe_dir.mkdir()
    
    # Create sample job scripts
    script1 = bcoe_dir / "run_job.sh"
    script1.write_text(sample_slurm_script_content)
    
    script2 = bcoe_dir / "helper.py"
    script2.write_text("print('Helper')")
    
    # Create a non-script file
    readme = bcoe_dir / "README.txt"
    readme.write_text("Documentation")

    scripts = scan_directory(temp_workspace)
    
    # We expect to find run_job.sh and helper.py, but not README.txt
    filenames = [s.name for s in scripts]
    assert "run_job.sh" in filenames
    assert "helper.py" in filenames
    assert "README.txt" not in filenames
    assert len(scripts) == 2

def test_parse_job_script_metadata(temp_workspace, sample_slurm_script_content):
    """Verify parser extracts metadata correctly from SLURM headers."""
    
    script_path = temp_workspace / "test_job.sh"
    script_path.write_text(sample_slurm_script_content)
    
    metadata = parse_job_script(script_path)
    
    assert metadata["job_name"] == "test-job"
    assert metadata["cpus"] == "4"
    assert metadata["memory"] == "8G"
    assert metadata["time"] == "01:00:00"
    assert "python/3.12" in metadata["modules"]

def test_parse_job_script_handles_missing_headers(temp_workspace):
    """Verify parser handles scripts without standard headers gracefully."""
    
    script_path = temp_workspace / "simple_script.sh"
    script_path.write_text("#!/bin/bash
echo 'No headers'")
    
    metadata = parse_job_script(script_path)
    
    assert metadata["job_name"] == "simple_script.sh" # Fallback to filename
    assert metadata["cpus"] is None
    assert metadata["memory"] is None

def test_parse_python_script_metadata(temp_workspace, sample_python_script_content):
    """Verify parser handles Python scripts (which might lack #SBATCH headers)."""
    
    script_path = temp_workspace / "analysis.py"
    script_path.write_text(sample_python_script_content)
    
    metadata = parse_job_script(script_path)
    
    assert metadata["job_name"] == "analysis.py"
    assert metadata["type"] == "python"
