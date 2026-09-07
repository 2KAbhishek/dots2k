import rlcompleter
import readline

class IndentableCompleter(rlcompleter.Completer):
    def complete(self, text, state):
        if text == '' or text.isspace():
            return ['    ', None][state]
        else:
            return super().complete(text, state)

readline.parse_and_bind('tab: complete')
readline.set_completer(IndentableCompleter().complete)

# Clean up namespace
del readline, rlcompleter, IndentableCompleter

