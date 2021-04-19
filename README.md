# ptexmatch

Small batch script that traverses subfolders and run zamaudio's ptformat/ptftool (https://github.com/zamaudio/ptformat) to extract clip information from Pro Tools session files.

The script will prompt for a folder containing Pro Tools sessions, a search string, and an output file (.csv) name. It will then find all .ptx files in subfolders and extract filenames containing the provided string.

## Requirements

Depends on Damien Zammit's ptformat/ptftool being in the correct subdirectory. This Pro Tools session file parser is included as a submodule in this repo. To ensure everything is working correctly, follow these steps:

1) clone this repo:
`git clone git@github.com:inf0l/ptexmatch.git`

2) initialize the submodule:
`git submodule init`

3) fetch submodule data:
`git submodule update`

4) enter subfolder and run make:
`cd ptformat; make; cd ..`


## Usage

Run the script using `./ptexmatch.sh`; the prompts are self-explanatory.

## Versions

#### 0.1

Initial commit. Hard-coded to search for music from audionetworks.com (filename starts with ANW).
