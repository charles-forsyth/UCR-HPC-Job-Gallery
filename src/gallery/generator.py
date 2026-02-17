from pathlib import Path
from typing import List, Dict
from jinja2 import Environment, FileSystemLoader
from .parser import JobScript
import datetime


class GalleryGenerator:
    def __init__(self, template_dir: Path, output_dir: Path):
        self.env = Environment(loader=FileSystemLoader(template_dir))
        self.output_dir = output_dir

    def group_by_department(self, jobs: List[JobScript]) -> Dict[str, List[JobScript]]:
        grouped: Dict[str, List[JobScript]] = {}
        for job in jobs:
            if job.department not in grouped:
                grouped[job.department] = []
            grouped[job.department].append(job)
        return dict(sorted(grouped.items()))

    def generate_readme(
        self, jobs: List[JobScript], template_name: str = "README.md.j2"
    ) -> None:
        template = self.env.get_template(template_name)
        jobs_by_dept = self.group_by_department(jobs)

        content = template.render(
            jobs_by_dept=jobs_by_dept,
            now=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        )

        output_path = self.output_dir / "README.md"
        output_path.write_text(content, encoding="utf-8")
        print(f"Generated README.md at {output_path}")

    def generate_gallery(
        self, jobs: List[JobScript], template_name: str = "gallery.html.j2"
    ) -> None:
        template = self.env.get_template(template_name)
        jobs_by_dept = self.group_by_department(jobs)

        content = template.render(
            jobs_by_dept=jobs_by_dept,
            now=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        )

        output_path = self.output_dir / "index.html"
        output_path.write_text(content, encoding="utf-8")
        print(f"Generated index.html at {output_path}")
