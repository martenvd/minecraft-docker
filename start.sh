#!/bin/bash

java -Xms${1}G -Xmx${2}G -jar /server.jar nogui
