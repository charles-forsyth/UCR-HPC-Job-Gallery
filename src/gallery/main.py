from pathlib import Path
from .parser import scan_repository
from .generator import GalleryGenerator


def scan_and_generate(project_root: Path, template_dir: Path) -> None:
    print(f"Scanning project root: {project_root}")
    jobs = scan_repository(project_root)
    print(f"Found {len(jobs)} job scripts.")

    generator = GalleryGenerator(template_dir, project_root)

    print("Generating artifacts...")
    generator.generate_readme(jobs)
    generator.generate_gallery(jobs)
    print("Done.")


def main() -> None:
    # src/gallery/main.py -> src/gallery -> src -> root
    project_root = Path(__file__).resolve().parent.parent.parent
    template_dir = project_root / "src" / "templates"
    scan_and_generate(project_root, template_dir)


if __name__ == "__main__":
    main()
