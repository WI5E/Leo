leo ![Java CI](https://github.com/Spottedleaf/leo/workflows/Java%20CI/badge.svg)
==

Fork of [Paper](https://github.com/PaperMC/Paper) aimed at improving server performance at high playercounts.

## Contact
[IRC](http://irc.spi.gt/iris/?channels=leo) | [Discord](https://discord.gg/CgDPu27)

## How To (Server Admins)
**NOTE:** leo requires Java 11 or higher.

leo uses the same paperclip jar system that Paper uses.

You can download the latest build of leo by going [here](https://ci.codemc.io/job/Spottedleaf/job/leo/).

You can also [build it yourself](https://github.com/Spottedleaf/leo#building)

## How To (Plugin developers)
In order to use leo as a dependency you must [build it yourself](https://github.com/Spottedleaf/leo#building).
Each time you want to update your dependency you must re-build leo.

leo-API maven dependency:
```xml
<dependency>
    <groupId>com.leo</groupId>
    <artifactId>leo-api</artifactId>
    <version>1.15.2-R0.1-SNAPSHOT</version>
    <scope>provided</scope>
 </dependency>
 ```

leo-Server maven dependency:
```xml
<dependency>
    <groupId>com.leo</groupId>
    <artifactId>leo</artifactId>
    <version>1.15.2-R0.1-SNAPSHOT</version>
    <scope>provided</scope>
</dependency>
```

There is no repository required since the artifacts should be locally installed
via building leo.

## Building

Requirements:
- You need `git` installed, with a configured user name and email. 
   On windows you need to run from git bash.
- You need `maven` installed
- You need `jdk` 11+ installed to compile (and `jre` 11 to run)
- Anything else that `paper` requires to build

If all you want is a paperclip server jar, just run `./leo jar`

Otherwise, to setup the `leo-API` and `leo-Server` repo, just run the following command
in your project root `./leo patch` additionally, after you run `./leo patch` you can run `./leo build` to build the 
respective api and server jars.

`./leo patch` should initialize the repo such that you can now start modifying and creating
patches. The folder `leo-API` is the api repo and the `leo-Server` folder
is the server repo and will contain the source files you will modify.

#### Creating a patch
Patches are effectively just commits in either `leo-API` or `leo-Server`.
To create one, just add a commit to either repo and run `./leo rb`, and a
patch will be placed in the patches folder. Modifying commits will also modify its
corresponding patch file.

## License
The PATCHES-LICENSE file describes the license for api & server patches,
found in `./patches` and its subdirectories except when noted otherwise.

Everything else is licensed under the MIT license, except when note otherwise.
See https://github.com/starlis/empirecraft and https://github.com/electronicboy/byof
for the license of material used/modified by this project.

### Note

The fork is based off of aikar's EMC framework found [here](https://github.com/starlis/empirecraft)
