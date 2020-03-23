import fileinput

st = set()

for line in fileinput.input():
    cols = line.strip().split(';')
    st.add(('("PT", "%s-%s", "%s")'%(cols[14], cols[15], cols[16])))

l = list(st)
l.sort()

print("INSERT INTO ZipCode(country, code, town) VALUES")
for i in range(len(l)):
    print(l[i], end='')
    if(i == len(l)-1): print(";")
    else             : print(",")
