
# Verifica se string é um numero
def is_number(s):
    try:
        int(s)
        return True
    except ValueError:
        return False
