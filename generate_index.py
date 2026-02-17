import os
import datetime
import re

GALLERY_ROOT = os.path.expanduser("~/job_gallery")
TEMPLATE_FILE = os.path.join(GALLERY_ROOT, "template.html")
INDEX_FILE = os.path.join(GALLERY_ROOT, "index.html")

def parse_job_name(filename):
    # Try to make the filename look like a title
    name = os.path.splitext(filename)[0]
    name = name.replace('_', ' ').replace('-', ' ')
    # Capitalize words
    return name.title()

def generate_html():
    if not os.path.exists(TEMPLATE_FILE):
        print(f"Error: Template file not found at {TEMPLATE_FILE}")
        return

    with open(TEMPLATE_FILE, "r") as f:
        template = f.read()

    cards_html = []
    
    # Walk through college directories
    colleges = sorted([d for d in os.listdir(GALLERY_ROOT) if os.path.isdir(os.path.join(GALLERY_ROOT, d)) and not d.startswith('.')])

    for college in colleges:
        college_path = os.path.join(GALLERY_ROOT, college)
        # Find script files
        for root, dirs, files in os.walk(college_path):
            for file in sorted(files):
                if file.endswith(('.sh', '.py', '.sbatch', '.slurm')):
                    # Check if it looks like a job script
                    job_path = os.path.join(root, file)
                    rel_path = os.path.relpath(job_path, GALLERY_ROOT)
                    job_name = parse_job_name(file)
                    
                    # Create card HTML
                    card = f"""
                    <div class="card">
                        <span class="domain-tag">{college}</span>
                        <h3><a href="{rel_path}">{job_name}</a></h3>
                        <p>Verified Workflow</p>
                        <a href="{rel_path}" class="btn">View Script</a>
                    </div>
                    """
                    cards_html.append(card)

    final_html = template.replace('<!-- Python script will inject content here -->', "\n".join(cards_html))
    
    # Add generation timestamp
    final_html = final_html.replace('</h1>', f'</h1><p style="text-align: center; font-size: 0.8em; color: #666;">Last updated: {datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")}</p>')

    with open(INDEX_FILE, "w") as f:
        f.write(final_html)
    
    print(f"Generated index at: {INDEX_FILE} with {len(cards_html)} entries.")

if __name__ == "__main__":
    generate_html()
