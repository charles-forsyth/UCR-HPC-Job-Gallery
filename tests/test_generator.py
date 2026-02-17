import pytest
import tempfile
import shutil
from pathlib import Path
from src.gallery.generator import generate_readme, generate_index_html

@pytest.fixture
def temp_templates_dir(temp_workspace):
    """Creates a temporary templates directory."""
    templates_dir = temp_workspace / "src" / "templates"
    templates_dir.mkdir(parents=True)
    return templates_dir

def test_generate_readme_uses_template(temp_templates_dir, temp_workspace):
    """Verify README generation uses provided data and Jinja2 template."""
    
    # Create sample template
    (temp_templates_dir / "README.md.j2").write_text(
        "# Job Gallery
{% for job in jobs %}- {{ job.name }}{% endfor %}"
    )
    
    jobs = [{"name": "Job A"}, {"name": "Job B"}]
    
    output_path = temp_workspace / "README.md"
    generate_readme(jobs, output_path, template_dir=temp_templates_dir)
    
    content = output_path.read_text()
    assert "- Job A" in content
    assert "- Job B" in content

def test_generate_index_html_uses_template(temp_templates_dir, temp_workspace):
    """Verify index.html generation uses provided data and Jinja2 template."""
    
    # Create sample template
    (temp_templates_dir / "gallery.html.j2").write_text(
        "<html><body><ul>{% for job in jobs %}<li>{{ job.name }}</li>{% endfor %}</ul></body></html>"
    )
    
    jobs = [{"name": "Job X"}, {"name": "Job Y"}]
    
    output_path = temp_workspace / "index.html"
    generate_index_html(jobs, output_path, template_dir=temp_templates_dir)
    
    content = output_path.read_text()
    assert "<li>Job X</li>" in content
    assert "<li>Job Y</li>" in content

def test_generate_readme_handles_empty_list(temp_templates_dir, temp_workspace):
    """Verify README generation handles empty job lists gracefully."""
    
    (temp_templates_dir / "README.md.j2").write_text(
        "# Job Gallery
{% if not jobs %}No jobs found{% endif %}"
    )
    
    generate_readme([], temp_workspace / "README.md", template_dir=temp_templates_dir)
    
    content = (temp_workspace / "README.md").read_text()
    assert "No jobs found" in content
