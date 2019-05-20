class Dir:
    def __init__(self,name,parent = None):
        self.dirs = []
        self.name = name
        self.parent = parent

root = Dir('/')
place = ''
inp = input("$>")
while inp.lower() != "exit":
    inp = inp.lower()
    inp = inp.strip().split()
    if inp[0]=='ls':
        for i in root.dirs:
            print(i.name)
    elif inp[0] == 'pwd':
        print('PATH:',root.name)
    elif inp[0] == 'mkdir':
        for i in inp[1:]:
            root.dirs.append(Dir(i,root))
        print("SUCC:","CREATED")
    elif inp[0] == 'rm':
        to_be_delete = []
        for i in root.dirs:
            if i.name in inp:
                to_be_delete.append(i)
                print("SUCC:","DELETED")
            else:
                print('ERR:','DIRECTORY NOT EXISTS')
                break
        for i in to_be_delete:
            root.dirs.remove(i)
    elif inp[0] == 'cd':
        for i in root.dirs:
            if inp[1] == i.name:
                root = i
                print("SUCC:","REACHED")
                break
        else:
            if inp[1] == '..':
                root = root.parent
            else:
                print('ERR:','INVALID PATH')
    elif inp[0] == 'session':
        while root.name!='/':
            root = root.parent
    else:
        print('ERR:','CANNOT RECOGNIZE INPUT')
    if root.name == '/':
        inp = input("$>")
    else:
        inp = input("$"+root.name+'>')