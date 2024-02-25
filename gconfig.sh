#!/bin/bash

auto_glink=true
require_gcopies=false #require directory 'gcopies' to put copes in. if gcopies exists, copies will go there even if this is turned off
unhide=false #removes "." in copied files

gprint-settings() {
    echo "auto_glink: $auto_glink"
}
