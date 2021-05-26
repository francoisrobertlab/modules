# modules

Modules for Robert Lab on Compute Canada servers.


* [Install](#install)
* [Configure - only step for most users](#configure)
* [Uninstall](#uninstall)



## Install

Clone modules repository in the projects folder.

:memo: *The examples use `def-robertf` project*

:memo: *The examples use the `apps` folder - it is customizable*

```shell
cd ~/projects/def-robertf
mkdir apps
cd apps
git clone https://github.com/francoisrobertlab/modules.git
```

Run configuration script.

```shell
~/projects/def-robertf/apps/modules/configure.sh
source ~/.bash_profile
```

Install robtools.

```shell
module load robtools
~/projects/def-robertf/apps/modules/robtools/install.sh
```


## Configure

All users that want to use robtools will need to run the configuration script.

```shell
~/projects/def-robertf/apps/modules/configure.sh
source ~/.bash_profile
```

Test if configuration worked.

```shell
module load robtools
robtools --help
```

### Remove configuration

If a user wants to stop using robtools, he can run the configuration script with `clean` argument.

```shell
~/projects/def-robertf/apps/modules/configure.sh clean
```


## Uninstall

Remove the `apps` (if not customized) folder from the project folder.

:memo: *It is preferable but not required to run the configuration script with `clean` argument for all users prior to uninstallation*

:memo: *The examples use `def-robertf` project*

:memo: *The examples use the `apps` folder - it is customizable*

```shell
cd ~/projects/def-robertf
rm -rf apps
```
