import typer

app = typer.Typer()

@app.command()
def hello(name: str):
    """Say hello to NAME."""
    print(f"Hello {name}")

@app.command()
def goodbye(name: str, formal: bool = False):
    """Say goodbye to NAME."""
    if formal:
        print(f"Goodbye {name}. Have a good day.")
    else:
        print(f"Bye {name}!")

import os

@app.command()
def show_persona():
    """Show the Gemini persona from the AgentOS configuration."""
    persona_path = os.path.expanduser("~/.agent-os/gemini-cli/user/GEMINI.md")
    if os.path.exists(persona_path):
        with open(persona_path, "r") as f:
            print(f.read())
    else:
        print(f"Persona file not found at: {persona_path}")

from gemini_cli.commands import task

app.add_typer(task.app, name="task")

if __name__ == "__main__":
    app()
