#!/bin/bash

cat test | sed 's/.*sm[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]//' > sed.test
