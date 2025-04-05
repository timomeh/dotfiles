from thefuck.utils import which
import shlex

def match(command):
    return ('rm is disabled' in command.output.lower())

def quote_arg(arg):
    # Avoid quoting ~
    return arg if arg.startswith('~') else shlex.quote(arg)

def get_new_command(command):
    raw = command.script

    if raw.startswith("fish -ic "):
        raw = shlex.split(raw)[2]

    # Original args untouched
    original_args = raw.partition(' ')[2]

    # Parsed and cleaned args for trash
    tokens = shlex.split(raw)
    cleaned_args = [
        t for t in tokens[1:] if t not in ('-r', '-f', '-rf', '-fr')
    ]
    quoted_cleaned = ' '.join(quote_arg(arg) for arg in cleaned_args)

    return [
        f"trash {quoted_cleaned}",
        f"rrm {original_args}"
    ]

priority = 1000

enabled_by_default = True