import re


def findTarget(source, start, end):
    pattern = f"{start}(.*?){end}"
    return re.findall(r'{}'.format(pattern), source)
