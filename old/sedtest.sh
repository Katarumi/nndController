#!/bin/bash
cat 1.html | sed -n 's/.*\(sm[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\).*/\1/p' grep.test 
