# jlenv-each: Execute a command for each Julia version

[![Build Status](https://travis-ci.com/jlenv/jlenv-each.svg?branch=master)](https://travis-ci.com/jlenv/jlenv-each)[![Codacy Badge](https://api.codacy.com/project/badge/Grade/a625ea1f234e41b284d87b5186228901)](https://www.codacy.com/manual/taqtiqa-mark/jlenv-jlenv-each?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=jlenv/jlenv-each&amp;utm_campaign=Badge_Grade)[CodeFactor](https://www.codefactor.io/repository/github/jlenv/jlenv-each/badge)](https://www.codefactor.io/repository/github/jlenv/jlenv-each)

This [jlenv](http://jlenv.github.io/jlenv) plugin adds the `jlenv update`
command that updates jlenv and all installed plugins.

## Installation

To install jlenv-each, clone this repository into your jlenv plugins directory.

```bash
git clone https://github.com/jlenv/jlenv-each.git "$(jlenv root)"/plugins/jlenv-each
```

## Usage

```bash
jlenv help each
```

Verbose mode will print a header for each Julia so you can distinguish the
output.

**Note**: [Version aliases](https://github.com/jlenv/jlenv-aliases)
(versions that are just symlinks pointing to another jlenv version) are skipped
when iterating through the list of jlenv versions.

### Examples

```bash
jlenv each julia -e 'using Pkg; Pkg.status()'
jlenv each echo $JLENV_ROOT
```

## Version History

- 1.0.0
  - Initial public release for Julia.

## License

Released under the MIT license. See `LICENSE` for details.
