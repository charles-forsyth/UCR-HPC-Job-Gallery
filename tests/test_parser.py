from src.gallery.parser import scan_repository, parse_job_script


def test_scan_repository_finds_scripts(temp_workspace, sample_slurm_script_content):
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

    scripts = scan_repository(temp_workspace)

    filenames = [s.path.name for s in scripts]
    assert "run_job.sh" in filenames
    assert "helper.py" in filenames
    assert "README.txt" not in filenames
    assert len(scripts) == 2


def test_parse_job_script_metadata(temp_workspace, sample_slurm_script_content):
    """Verify parser extracts metadata correctly from SLURM headers."""

    script_path = temp_workspace / "test_job.sh"
    script_path.write_text(sample_slurm_script_content)

    # Need to pass project_root to parse_job_script
    job = parse_job_script(script_path, temp_workspace)

    assert job is not None
    assert job.name == "test-job"  # My implementation uses metadata["job-name"]
    # My implementation only parses #SBATCH --key=value
    # sample content has #SBATCH --cpus-per-task=4
    assert job.metadata["cpus-per-task"] == "4"
    assert job.metadata["mem"] == "8G"
    assert job.metadata["time"] == "01:00:00"


def test_parse_job_script_handles_missing_headers(temp_workspace):
    """Verify parser handles scripts without standard headers gracefully."""

    script_path = temp_workspace / "simple_script.sh"
    script_path.write_text("#!/bin/bash\necho 'No headers'")

    job = parse_job_script(script_path, temp_workspace)

    assert job is not None
    # Fallback to title-cased filename without extension
    assert job.name == "Simple Script"
    assert job.metadata == {}


def test_parse_python_script_metadata(temp_workspace, sample_python_script_content):
    """Verify parser handles Python scripts (which might lack #SBATCH headers)."""

    script_path = temp_workspace / "analysis.py"
    script_path.write_text(sample_python_script_content)

    job = parse_job_script(script_path, temp_workspace)

    assert job is not None
    assert job.name == "Analysis"
    assert job.script_type == "py"
