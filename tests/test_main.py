from src.gallery.main import scan_and_generate


def test_scan_and_generate_creates_artifacts(temp_workspace):
    """Verify integration of parser and generator."""

    # Setup directories
    (temp_workspace / "BCOE").mkdir()
    (temp_workspace / "CHASS").mkdir()
    (temp_workspace / "src" / "templates").mkdir(parents=True)

    # Create sample scripts
    (temp_workspace / "BCOE" / "job1.sh").write_text(
        "#!/bin/bash\n#SBATCH --job-name=job1"
    )
    (temp_workspace / "CHASS" / "job2.py").write_text("print('Hello')")

    # Create templates
    template_dir = temp_workspace / "src" / "templates"
    (template_dir / "README.md.j2").write_text("README CONTENT")
    (template_dir / "gallery.html.j2").write_text("HTML CONTENT")

    readme_path = temp_workspace / "README.md"
    index_path = temp_workspace / "index.html"

    scan_and_generate(project_root=temp_workspace, template_dir=template_dir)

    assert readme_path.exists()
    assert index_path.exists()
    assert readme_path.read_text() == "README CONTENT"
