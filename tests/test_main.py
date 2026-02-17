import pytest
from pathlib import Path
from src.gallery.main import main, scan_and_generate

def test_scan_and_generate_creates_artifacts(temp_workspace, temp_templates_dir):
    """Verify integration of parser and generator."""
    
    # Create mock departmental directories
    (temp_workspace / "BCOE").mkdir()
    (temp_workspace / "CHASS").mkdir()
    
    # Create sample scripts
    (temp_workspace / "BCOE" / "job_script_1.sh").write_text("#!/bin/bash
#SBATCH --job-name=job1")
    (temp_workspace / "CHASS" / "job_script_2.py").write_text("print('Hello from Python')")

    # Create templates
    (temp_templates_dir / "README.md.j2").write_text("# Gallery
{% for job in jobs %}- {{ job.name }}{% endfor %}")
    (temp_templates_dir / "gallery.html.j2").write_text("<html>{% for job in jobs %}<p>{{ job.name }}</p>{% endfor %}</html>")

    readme_path = temp_workspace / "README.md"
    index_path = temp_workspace / "index.html"
    
    scan_and_generate(project_root=temp_workspace, template_dir=temp_templates_dir)
    
    assert readme_path.exists()
    assert index_path.exists()
    
    readme_content = readme_path.read_text()
    assert "- job1" in readme_content
    assert "- job_script_2.py" in readme_content

def test_main_cli_execution(temp_workspace, temp_templates_dir, capsys):
    """Verify main function executes without errors."""
    
    # Mock sys.argv if necessary, but calling main() directly is usually sufficient for unit tests
    # if main() accepts arguments.
    
    with pytest.raises(SystemExit) as e:
        main(["--help"])
    
    assert e.type == SystemExit
    assert e.value.code == 0
