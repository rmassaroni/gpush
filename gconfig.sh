#!/bin/bash

auto_glink=true
require_gcopies=false #require directory 'gcopies' to put copes in. if gcopies exists, copies will go there even if this is turned off
unhide=true #removes "." in copied files
default_message="unnamed commit"
default_branch="main"
glink_dir="./"


gprint-settings() {
    echo "auto_glink: $auto_glink"
    echo "require_gcopies: $require_gcopies"
    echo "unhide: $unhide"
}
