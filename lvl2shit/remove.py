import level
import re
import sys
regex = re.compile(r'kS38,[^,]+')
regex2 = re.compile(r'kA6,[^,]+')
def removeThing(itm,st):
	return re.sub(rf'{itm},[^,]+,','',st)
blacklist = open('deco.txt','r').read().split(' ')
default_blocks = open('block.txt','r').read().split(' ')
slope1_blocks = open('slope1.txt','r').read().split(' ')
slope2_blocks = open('slope2.txt','r').read().split(' ')
spike1_blocks = open('spikes1.txt','r').read().split(' ')
half_blocks = open('halfblocks.txt','r').read().split(' ')
name = input('Name:')
songid = 0
if sys.argv[1]=="file":
	import gzip,base64
	f = input('File:').strip()
	a = level.levelString(name,gzip.decompress(base64.b64decode(open(f,'rb').read(),'-_')).decode())
else:
	id = input('ID:')
	songid = level.getSong(id)
	a = level.Level.downloadLevel(name,id)
x = a.blocks
m = []
for obj in x:
	if str(obj['blockid']) in default_blocks:
		obj['blockid'] = '1'
	if str(obj['blockid']) in slope1_blocks:
		obj['blockid'] = '1743'
	if str(obj['blockid']) in slope2_blocks:
		obj['blockid'] = '1744'
	if str(obj['blockid']) in spike1_blocks:
		obj['blockid'] = '8'
	if str(obj['blockid']) in half_blocks:
		obj['blockid'] = '1903'
	if str(obj['blockid']) not in blacklist:
		m.append(obj)
a.blocks = m
a.header = regex.sub('kS38,1_40_2_125_3_255_11_255_12_255_13_255_4_-1_6_1000_7_1_15_1_18_0_8_1|1_0_2_102_3_255_11_255_12_255_13_255_4_-1_6_1001_7_1_15_1_18_0_8_1|1_0_2_102_3_255_11_255_12_255_13_255_4_-1_6_1009_7_1_15_1_18_0_8_1|1_255_2_255_3_255_11_255_12_255_13_255_4_-1_6_1002_5_1_7_1_15_1_18_0_8_1|1_0_2_255_3_125_11_255_12_255_13_255_4_-1_6_1005_5_1_7_1_15_1_18_0_8_1|1_0_2_255_3_125_11_255_12_255_13_255_4_-1_6_1006_5_1_7_1_15_1_18_0_8_1|1_0_2_0_3_0_11_255_12_255_13_255_4_-1_6_3_7_1_15_1_18_0_8_1|',a.header)
a.header = regex2.sub('kA6,1',a.header)
for x in range(29,38):
	a.header = removeThing('kS%d'%x,a.header)
print(a.header)
a.uploadLevel(input("username:"),input("passwd:"),songid=songid)
