from pathlib import Path
from typing import List, Optional, Dict
import re
from dataclasses import dataclass


@dataclass
class JobScript:
    name: str
    path: Path  # Relative to project root
    department: str
    script_type: str
    metadata: Dict[str, str]

    @property
    def relative_path(self) -> str:
        return str(self.path)


def extract_metadata(content: str) -> Dict[str, str]:
    metadata = {}
    # Find SBATCH directives
    # Example: #SBATCH --job-name=MyJob
    for line in content.splitlines():
        line = line.strip()
        if line.startswith("#SBATCH"):
            match = re.search(r"--([\w-]+)=(.+)", line)
            if match:
                key = match.group(1)
                value = match.group(2).strip()
                metadata[key] = value
    return metadata


def parse_job_script(file_path: Path, project_root: Path) -> Optional[JobScript]:
    try:
        content = file_path.read_text(encoding="utf-8", errors="ignore")
    except Exception:
        return None

    metadata = extract_metadata(content)

    try:
        relative_path = file_path.relative_to(project_root)
        # Assuming structure: ProjectRoot/Department/Script.ext
        # First part is Department
        department = (
            relative_path.parts[0] if len(relative_path.parts) > 1 else "Uncategorized"
        )
    except ValueError:
        # Should not happen if file_path is inside project_root
        return None

    # Name: Use job-name from metadata or filename (minus extension, title case)
    name = metadata.get("job-name", file_path.stem.replace("_", " ").title())

    return JobScript(
        name=name,
        path=relative_path,
        department=department,
        script_type=file_path.suffix.lstrip("."),
        metadata=metadata,
    )


def scan_repository(root_dir: Path) -> List[JobScript]:
    jobs = []
    # Directories to ignore at root level
    ignore_dirs = {
        ".git",
        ".squad",
        ".venv",
        "src",
        "tests",
        "__pycache__",
        ".gemini",
        "node_modules",
    }
    # Valid script extensions
    valid_extensions = {".sh", ".sbatch", ".slurm", ".py", ".R", ".jl"}

    for item in root_dir.iterdir():
        if (
            item.is_dir()
            and item.name not in ignore_dirs
            and not item.name.startswith(".")
        ):
            # This is a Department folder (e.g., BCOE, CHASS)
            # Scan recursively
            for file_path in item.rglob("*"):
                if file_path.is_file() and file_path.suffix in valid_extensions:
                    # Filter out hidden files or files in hidden directories
                    if any(
                        part.startswith(".")
                        for part in file_path.relative_to(item).parts
                    ):
                        continue

                    job = parse_job_script(file_path, root_dir)
                    if job:
                        jobs.append(job)

    return sorted(jobs, key=lambda j: (j.department, j.name))
