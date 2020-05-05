# SAGE
# 8.0
#set -gx PATH $PATH '/home/luiz/SAGE/SageMath'
# 8.4
#set -gx PATH '/home/luiz/SAGE/sage8.4/SageMath' $PATH 
# 8.7
set -gx PATH '/home/luiz/SAGE/sage8.7/SageMath' $PATH 
# 9.0
# set -gx PATH '/home/luiz/SAGE/sage9.0' $PATH 

# GUROBI
set -gx PATH $PATH '/home/luiz/GUROBI/gurobi752/linux64/bin'
set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH '/home/luiz/GUROBI/gurobi752/linux64/lib'
set -gx GRB_LICENSE_FILE '/home/luiz/GUROBI/gurobi.lic'

# Documentation
set -gx MANPATH '/usr/share/man'

# EDITOR
set -gx EDITOR "vim"

# GHC
set -gx PATH '/home/luiz/.ghcup/bin' $PATH

# supress initial message
set fish_greeting ""

# java
set -gx PATH '/home/luiz/jre/jre1.8.0_241/bin' $PATH 