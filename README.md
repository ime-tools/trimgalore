# trimgalore

## Latest release

The latest release is v0.4.5.1. Be warned, that `trimgalore` itself will report `v0.4.4_dev`, but that is an error in the `trimgalore` release and already reported.

## Docker images

### Based on last Release (v0.4.5.1):
- [![](https://images.microbadger.com/badges/image/imetools/trimgalore:v0.4.5.1.svg)](https://microbadger.com/images/imetools/trimgalore:v0.4.5.1 "Get your own image badge on microbadger.com")
- [![](https://images.microbadger.com/badges/version/imetools/trimgalore:v0.4.5.1.svg)](https://microbadger.com/images/imetools/trimgalore:v0.4.5.1 "Get your own version badge on microbadger.com")
- [![](https://images.microbadger.com/badges/commit/imetools/trimgalore:v0.4.5.1.svg)](https://microbadger.com/images/imetools/trimgalore:v0.4.5.1 "Get your own commit badge on microbadger.com")

### Latest image:
- [![](https://images.microbadger.com/badges/image/imetools/trimgalore.svg)](https://microbadger.com/images/imetools/trimgalore "Get your own image badge on microbadger.com")
- [![](https://images.microbadger.com/badges/version/imetools/trimgalore.svg)](https://microbadger.com/images/imetools/trimgalore "Get your own version badge on microbadger.com")
- [![](https://images.microbadger.com/badges/commit/imetools/trimgalore.svg)](https://microbadger.com/images/imetools/trimgalore "Get your own commit badge on microbadger.com")

### Based on master branch:
- [![](https://images.microbadger.com/badges/image/imetools/trimgalore:master.svg)](https://microbadger.com/images/imetools/trimgalore:master "Get your own image badge on microbadger.com")
- [![](https://images.microbadger.com/badges/version/imetools/trimgalore:master.svg)](https://microbadger.com/images/imetools/trimgalore:master "Get your own version badge on microbadger.com")
- [![](https://images.microbadger.com/badges/commit/imetools/trimgalore:master.svg)](https://microbadger.com/images/imetools/trimgalore:master "Get your own commit badge on microbadger.com")

### Based on develop branch:
- [![](https://images.microbadger.com/badges/image/imetools/trimgalore:develop.svg)](https://microbadger.com/images/imetools/trimgalore:develop "Get your own image badge on microbadger.com")
- [![](https://images.microbadger.com/badges/version/imetools/trimgalore:develop.svg)](https://microbadger.com/images/imetools/trimgalore:develop "Get your own version badge on microbadger.com")
- [![](https://images.microbadger.com/badges/commit/imetools/trimgalore:develop.svg)](https://microbadger.com/images/imetools/trimgalore:develop "Get your own commit badge on microbadger.com")

## Usage:

Due to the image has `trimgalore` as entry point, calling `docker run` will return the help text:

```
$ docker run --rm -it imetools/trimgalore:v0.4.5
###
###    USAGE:
###
###   trim_galore [options] <filename(s)>
###
###
###   -h/--help               Print this help message and exits.
###
###   -v/--version            Print the version information and exits.
###
###   -q/--quality <INT>      Trim low-quality ends from reads in addition to adapter removal. For
###                           RRBS samples, quality trimming will be performed first, and adapter
###                           trimming is carried in a second round. Other files are quality and adapter
###                           trimmed in a single pass. The algorithm is the same as the one used by BWA
###                           (Subtract INT from all qualities; compute partial sums from all indices
###                           to the end of the sequence; cut sequence at the index at which the sum is
###                           minimal). Default Phred score: 20.
###
###   --phred33               Instructs Cutadapt to use ASCII+33 quality scores as Phred scores
###                           (Sanger/Illumina 1.9+ encoding) for quality trimming. Default: ON.
[...]

```

The version of `trimgalore` is returned, if `--version` is used as command:

```
$ docker run --rm -it imetools/trimgalore:v0.4.5 --version
###
###                             Quality-/Adapter-/RRBS-Trimming
###                                  (powered by Cutadapt)
###                                     version 0.4.4_dev
###
###                                Last update: 24 03 2017
###

```
Therefore you can almost use `trimgalore` like a local installation.

## License

This repo is licences under MIT licence. For further information please check the content of the (LICENSE) file.

## Issues

If you have any issues concerning the image or the repository, please report them via [issues](https://github.com/ime-tools/trimgalore/issues).

## Author

This repository is created and maintained by Frank Förster.

## Changelog

- `v0.4.5.1` Adding parallel and new FastQC to image
   - trimgalore v0.4.5 (selfreporting as v0.4.4_dev)
   - FastQC v0.11.7
   - GNU parallel 20141022
- `v0.4.5` First official release of the image. It includes
   - trimgalore v0.4.5 (selfreporting as v0.4.4_dev)
   - FastQC v0.11.4
