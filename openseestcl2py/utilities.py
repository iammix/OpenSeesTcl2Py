from typing import List


def convert_to_number(s: str) -> float or int:
    try:
        num = float(s)
    except ValueError:
        num = s
    return num
