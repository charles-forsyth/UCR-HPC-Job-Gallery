import pytest
from pathlib import Path
from src.gallery.generator import GalleryGenerator
from src.gallery.parser import JobScript


@pytest.fixture
def temp_templates_dir(temp_workspace):
    templates_dir = temp_workspace / "src" / "templates"
    templates_dir.mkdir(parents=True)
    return templates_dir


def test_generate_readme_uses_template(temp_templates_dir, temp_workspace):
    """Verify README generation uses provided data and Jinja2 template."""

    # Create sample template
    (temp_templates_dir / "README.md.j2").write_text(
        """# Job Gallery
{% for dept, jobs in jobs_by_dept.items() %}
{{ dept }}:
{% for job in jobs %}- {{ job.name }}{% endfor %}
{% endfor %}"""
    )

    jobs = [
        JobScript(
            name="Job A",
            path=Path("BCOE/job_a.sh"),
            department="BCOE",
            script_type="sh",
            metadata={},
        ),
        JobScript(
            name="Job B",
            path=Path("CHASS/job_b.py"),
            department="CHASS",
            script_type="py",
            metadata={},
        ),
    ]

    generator = GalleryGenerator(temp_templates_dir, temp_workspace)
    generator.generate_readme(jobs)

    output_path = temp_workspace / "README.md"
    content = output_path.read_text()
    assert "- Job A" in content
    assert "- Job B" in content
    assert "BCOE:" in content


def test_generate_gallery_uses_template(temp_templates_dir, temp_workspace):
    """Verify index.html generation uses provided data and Jinja2 template."""

    # Create sample template
    (temp_templates_dir / "gallery.html.j2").write_text(
        """<html><body>
        {% for dept, jobs in jobs_by_dept.items() %}
        <h2>{{ dept }}</h2>
        <ul>{% for job in jobs %}<li>{{ job.name }}</li>{% endfor %}</ul>
        {% endfor %}
        </body></html>"""
    )

    jobs = [
        JobScript(
            name="Job X",
            path=Path("BCOE/job_x.sh"),
            department="BCOE",
            script_type="sh",
            metadata={},
        )
    ]

    generator = GalleryGenerator(temp_templates_dir, temp_workspace)
    generator.generate_gallery(jobs)

    output_path = temp_workspace / "index.html"
    content = output_path.read_text()
    assert "<li>Job X</li>" in content
    assert "<h2>BCOE</h2>" in content
