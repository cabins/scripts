#!/bin/bash

echo -e "\n * Checking the latest version...\n"
base_uri=https://download.eclipse.org/jdtls/snapshots/
latest_uri=latest.txt
latest_file=$(curl -s ${base_uri}${latest_uri})
local_file=$(ls . | grep -e "jdt-language-server.*\.tar.gz$")

echo " * The latest version is: " $latest_file
echo " * The local version is: " $local_file

echo -n " * ACTIONS: "

if [ "$latest_file" == "$local_file" ]; then
    echo -e "Already the latest version. Quit.\n"
else
    echo -e "Needs to update, starting download with axel...\n\n"
    file_uri="${base_uri}${latest_file}"
    axel -n 10 $file_uri

    echo -e "\n * Extract the file to <server> folder...\n\n"
    rm -rf server
    mkdir server
    tar xf $latest_file -C server/

    echo -e " * Cleaning the old version file...\n"
    if [ -n "$local_file" ]; then
        rm "$local_file"
    fi
fi

echo -e " * DONE.\n"
