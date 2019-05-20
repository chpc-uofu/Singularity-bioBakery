-- -*- lua -*-
-- Written by MC on 3/5/2019
help(
[[
This module sets up bioBakery container by aliasing the container shell login to the bioBakery command

Based on DockerHub container https://hub.docker.com/r/biobakery/workflows

Run as "runbioBakery arguments".
]])

depends_on("singularity")
local BBPATH="/uufs/chpc.utah.edu/sys/installdir/bioBakery/1.7"

set_shell_function("startbioBakery",'singularity shell -s /bin/bash ' .. BBPATH .. '/bioBakery.sif',"singularity shell -s /bin/bash " .. BBPATH .. "/bioBakery.sif")
set_shell_function("runbioBakery",'singularity exec ' .. BBPATH .. '/bioBakery.sif "$@"',"singularity exec " .. BBPATH .. "/bioBakery.sif $*")
-- to export the shell function to a subshell
if (myShellName() == "bash") then
 execute{cmd="export -f startbioBakery",modeA={"load"}}
 execute{cmd="export -f runbioBakery",modeA={"load"}}
end

whatis("Name        : bioBakery")
whatis("Version     : 1.7")
whatis("Category    : A virtual environment for meta'omic analysis")
whatis("URL         : https://bitbucket.org/biobakery/biobakery/wiki/Home")
whatis("Installed on 03/05/2019")
whatis("Installed by : Martin Cuma")


