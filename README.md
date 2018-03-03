# Debbuilder

Create reroducible builds of packages in a system-indipendent way.

## How to use it

On first clone

- clone the repo
- run `script/setup`

## Folder structure

```
.
├── build-environment.sh
├── build.sh
├── dist                    contains built .deb files
├── lastpass-cli            package folder
│   ├── description-pak     description as used by checkinstall
│   └── ubuntu-xenial       package platform folder
│       ├── build.sh        actual build script
│       ├── Dockerfile      build environment dockerfile
│       └── release         count releases
├── README.md
└── script

```

## Build build environment

Build environment can be created calling `build-environment.sh package platform`

## Build package

Be sure to have built the required environment.

Then run `build.sh package platform <version>`
