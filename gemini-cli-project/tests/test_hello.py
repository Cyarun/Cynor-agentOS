import sys
from io import StringIO
from gemini_cli.core.hello_world import say_hello

def test_say_hello():
    captured_output = StringIO()
    sys.stdout = captured_output
    say_hello()
    sys.stdout = sys.__stdout__
    assert captured_output.getvalue().strip() == "Hello, World!"
