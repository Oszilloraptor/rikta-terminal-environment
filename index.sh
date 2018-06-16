#!/usr/bin/env bash
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export RTE_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

. ${RTE_PATH}/ENV.sh
. ${RTE_PATH}/functions_and_aliases.sh
. ${RTE_PATH}/prompt.sh
. ${RTE_PATH}/shopt.sh
. ${RTE_PATH}/startup_screen.sh