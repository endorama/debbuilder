# Debbuilder

Create reroducible builds of packages in a system-indipendent way.

## How to use it

On first clone

- clone the repo
- run `script/setup`

## Folder structure

```
.
├── build-environment.sh 	Build docker images
├── build.sh 				Build packages
├── clean-build.sh 			Clean builded packages
├── send-to-ppa.sh 			Send sources to PPA
├── lastpass-cli            package folder
│   └── ubuntu-xenial       package platform folder
│       ├── build.sh        actual build script
│       ├── Dockerfile      build environment dockerfile
│       └── release-version count releases
├── README.md
└── script

```

## Workflow

You should have a valid GPG key in your local gpg keystore.

### Add package

- create a top level folder named as the package you want to build.
- add git repo ( as submodule ) under $package/src ( or source code )
- add os-version under $package ( es. ubuntu-xenial, ubuntu-zesty )
- create build script in $package/os-version/build.sh with custom instruction
  for building the package

### Build environment

Building environment are managed using docker, and can be build using
`build-environment.sh <package> <platform>`.

### Build package

Run `build.sh <package> <platform> <version>`

### Upload package to PPA

Run `send-to-ppa.sh <package> <platform> <version>`

### Clean buildfiles

Run `clean-build.sh <package>`

## Contribute

Hi! This repo has been made mainly for managing my personal builds, so there is
stuff hardcoded here and there :)

But if you are interested in using it, reach me by email or twitter ( [@edoardotenani][twitter] )
and I'll gladly help you.

## Credits

GPG-agent in docker thanks to [Nixaid](https://nixaid.com/using-gpg-inside-a-docker-container/)
Building deb package thanks to [Luzifer](https://gist.github.com/Luzifer/4a89674bf20b6cddd8e73e9c4c46dd82)

[twitter]: https://twitter.com/edoardotenani
