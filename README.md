# eviacam
Install eViacam on a modern Linux machine

## Description
eViacam allows you to control your Linux computer with face tracking. Your face movement is able to control your mouse cursor, reducing strain from RSI, or providing a reasonably useful accessibility feature to users who are able to move their head with precision (ie., shakiness would affect the usefulness of this process).

## Reasoning
I suffer from Ulnar Nerve Entrapment. A very painful RSI that comes and goes when I work myself too hard at my desk. Usually there are signs of it coming on that warn me to take a rest, but recently, while working on a customer deadline, I ignored these signs and have been regretting it for weeks as I suffer with the worst relapse I've had in several years. I remembered [demoing eViacam on Category5 Technology TV way back in 2012](https://category5.tv/shows/technology/episode/259/), so I set out to install it via the traditional means on my shiny modern Linux Mint 19 box. But it didn't work. I needed to get it working to be able to control my computer and relax my arm long enough to heal, so I did... and then decided to make it easier for the next person by creating an easy installer script.

## How it works
./install.sh starts by adding a bunch of dependencies (via apt), then removes the version on wxWidgets that comes with the distro (on Mint 19 the included version does not support GTK 3). Then, from the GitHub repositories, wxWidgets is re-compiled using a specific "tested to work" version, including GTK 3 extensions, and then finally, eViacam is compiled.

## Disclaimer
While this script shouldn't break your system, it could. It removes wxWidgets and replaces it with a newer version which may or may not be compatible with GUI tools you use. On a reasonably vanilla Linux Mint 19, there appear to be no ill effects of this transition. If you experience difficulty, you can reinstall wxWidgets using apt, which will regress it to the old version. I don't take any responsibility for breaking your system. Please understand what you're doing at least well enough to undo it should something go wrong.

## Thanks
Much of how this works was learned by reading through this issue thread: https://github.com/cmauri/eviacam/issues/14
