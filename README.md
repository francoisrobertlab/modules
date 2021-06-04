# modules

Modules for Robert Lab on Compute Canada servers.


* [Install](#install)
* [Configure - only step for most users](#configure)
* [Emails - to receive emails when running jobs](#emails)
* [Installing software](#installing-software)
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

If your project is not `def-robertf`, run the `change-project.sh` script.

:memo: *Replace `$project` with the name of your project*

```shell
~/projects/def-robertf/apps/modules/robtools/change-project.sh $project
```


## Configure

All users that want to use modules will need to run the configuration script.

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

If a user wants to stop using modules, he can run the configuration script with `clean` argument.

```shell
~/projects/def-robertf/apps/modules/configure.sh clean
```


## Emails

To receive emails for jobs, run the following command:

:memo: *Replace `$email` with your email address*

```shell
email-sbatch.sh $email
```

### Stop receiving emails for jobs

To stop receiving emails for jobs, run the following command:

```shell
email-sbatch.sh clean
```


## Installing software

Most modules have an installation script called `install.sh` that allows to install the required software.

To install robtools.

```shell
module load robtools
~/projects/def-robertf/apps/modules/robtools/install.sh
```

To install plot2DO.

```shell
module load plot2do
~/projects/def-robertf/apps/modules/plot2do/install.sh
```

:memo: *Some installation scripts like plot2DO requires to manually run additional commands, read the last output lines carefully*


## Uninstall

Remove the `apps` (if not customized) folder from the project folder.

:memo: *It is preferable but not required to run the configuration script with `clean` argument for all users prior to uninstallation*

:memo: *The examples use `def-robertf` project*

:memo: *The examples use the `apps` folder - it is customizable*

```shell
cd ~/projects/def-robertf
rm -rf apps
```
