import re

source = 'abcde'

test = re.findall(rf'a(.*?)d', source)
