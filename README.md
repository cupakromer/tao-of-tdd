# Tao of TDD

Live Presentation Discussing BDD and TDD Basics

## How to use this repository

The presentation is written using [Parade](https://github.com/burtlo/parade). A
[`Gemfile`](Gemfile) is already configured for you. To get started:

```bash
$ bundle
$ parade
```

The presentation is short and covers some very basic background. The real
knowledge is in the embedded gems. The entire repository is designed to be used
as a chronological learning tool.

We suggest you start reviewing the commits one-by-one. Each commit is designed
to teach a little more about the BDD and TDD process. The code changes are
logically grouped together and annotated. The commit messages are also used to
comment on the process as the tools are designed.


## [Adder](adder)

A simple command line tool for adding numbers together.

Start your learning with the commits for this tool.


## [Trader](trader)

A more complete command line tool based off of the
[International Trade](http://www.puzzlenode.com/puzzles/1-international-trade)
puzzle node problem.

The process of developing this tool is essentially the same. However, as it's
more involved, it will help highlight more design trade-offs and decisions.
