# Design Doc: UCR HPC Job Gallery

**Mission:** Automate the maintenance and presentation of the UCR HPC Job Gallery. The system will parse the repository structure (BCOE, CHASS, CNAS, etc.) to generate both a comprehensive, professional `README.md` and a rich `index.html` gallery.

## Architecture Overview

The system follows a "Static Site Generator" pattern. A core Python engine scans the directory hierarchy, extracts metadata from job scripts, and uses Jinja2 templates to produce documentation artifacts.

### Core Directives
- **Separation of Concerns:** Logic is isolated in `src/`, while job scripts remain in their departmental directories.
- **Portability:** Use relative paths to ensure the project works across different environments (local, workstation, cluster).
- **Automation-First:** Every change to the script library should trigger a regeneration of the gallery via CI/CD.

## Tech Stack

- **Language:** Python 3.12+
- **Package Management:** `uv` (Fastest Python package manager)
- **Templating:** Jinja2 (For robust HTML and Markdown generation)
- **Linting/Formatting:** Ruff (Consolidated linter and formatter)
- **Static Analysis:** Mypy (Type checking)
- **Testing:** Pytest (Unit and functional verification)

## Project Structure

```text
UCR-HPC-Job-Gallery/
├── pyproject.toml         # Project configuration and dependencies
├── README.md              # Generated: Professional overview and submission guide
├── index.html             # Generated: Visual gallery
├── src/
│   ├── gallery/
│   │   ├── __init__.py
│   │   ├── main.py        # Entry point for regeneration
│   │   ├── parser.py      # Logic to scan directories and extract script metadata
│   │   └── generator.py   # Jinja2 orchestration
│   └── templates/
│       ├── README.md.j2   # Markdown template
│       └── gallery.html.j2 # HTML gallery template
├── BCOE/                  # Job Scripts (Data Source)
├── CHASS/
├── CNAS/
└── ...
```

## Component Breakdown

### 1. The Parser (`src/gallery/parser.py`)
- Scans departmental folders.
- Identifies job scripts (`.sh`, `.py`, `.sbatch`).
- Parses script headers (e.g., `#SBATCH --job-name`) to extract metadata like requirements (CPU, RAM, GPU).

### 2. The Generator (`src/gallery/generator.py`)
- Loads Jinja2 templates.
- Injects parsed script data into templates.
- Writes `README.md` and `index.html`.

### 3. CI/CD Workflow (`.github/workflows/ci.yml`)
- Triggers on `push` to `main`.
- Runs the Local Gauntlet (Lint, Format, Type Check, Test).
- Regenerates artifacts.
- Commits changes back to the repository (or deploys to GitHub Pages).

## Development Workflow (The Local Gauntlet)

To ensure code quality, all developers must pass the following steps before pushing:

1.  **Lint & Fix:** `uv run ruff check . --fix`
2.  **Format:** `uv run ruff format .`
3.  **Type Check:** `uv run mypy src`
4.  **Test:** `uv run pytest`
5.  **Build:** `uv run python -m gallery.main`

## Success Criteria

1.  `README.md` is automatically updated with all scripts categorized by department.
2.  `README.md` includes clear `sbatch` submission instructions for each script type.
3.  `index.html` remains visually consistent with the existing theme but is generated from a robust template.
4.  Zero hardcoded absolute paths in the source code.
