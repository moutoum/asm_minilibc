#!/usr/bin/python

import os
import sys
from subprocess import call

nbTests = 15
nbTestsSuccess = 0
i = 1

def getStatus(status):
	if status == 0:
		status = "\033[32;1mOK\033[0m"
	else:
		status = "\033[31;1mKO\033[0m"
	return status

sys.stdout.write("\033[1mCompilation:\033[0m ")
status = os.system("make test 2>&1 > /dev/null")
print getStatus(status) + "\n"
if status != 0:
	exit();

while i <= nbTests:
	status_ref = os.system("./mouli %d > .a" % i)
	status_my =  os.system("LD_PRELOAD=./libasm.so ./mouli %d > .b" % i)
	status = os.system("diff .a .b > /dev/null")
	if status == 0 and status_ref == status_ref:
		print "Test {}: \033[32;1mOK\033[0m".format(i)
		nbTestsSuccess += 1;
	else:
		print "Test {}: \033[31;1mKO\033[0m".format(i)
	os.system("rm -f .a .b")
	i += 1
os.system("make fclean > /dev/null")
print "\nResult: {}% ({}/{})".format((nbTestsSuccess * 100) / nbTests, nbTestsSuccess, nbTests)
