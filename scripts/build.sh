#!/bin/bash

nvim -u ./minit.lua --headless +"lua require('neomodern.extras').setup()" +qa
