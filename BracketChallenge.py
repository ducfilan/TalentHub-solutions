input = raw_input()


def isBalanced(expr):
    if len(expr) % 2 != 0:
        return 'false'

    opening = set('([{')
    match = set([('(', ')'), ('[', ']'), ('{', '}')])
    stack = []

    for char in expr:
        if char in opening:
            stack.append(char)
        else:
            if len(stack) == 0:
                return 'false'
            lastOpen = stack.pop()
            if (lastOpen, char) not in match:
                return 'false'
    return ('true' if len(stack) == 0 else 'false')


print isBalanced(input)
