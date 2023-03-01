# Sites
This repository hold the content and design of following web pages:
- `tclb.io` - TCLB Solver website
- `mcf.tclb.io` - UQ's MCF Group website

# Contributing
The sites are generated from common content with Hugo static webpage generator.

## Testing & preview

When doing changes, you can inspect the results by running Hugo locally.
To preview the MCF webpage:
```bash
hugo --config mcf server
```
This will start up a local server. Just ctrl+click the displayed address and inspect.
Changes you make will be imediately refreshed in browser.

For the TCLB site:
```bash
hugo --config mcf server
```

## Publishing
Any changes on the `master` branch will be published on the webpages.
All major changes should be done through a Pull Request.

# Structure
The repo is designed to hold data for multiple sites.
Most content should be kept in the common folders.
## `content/people`
## `content/doi`
## `static/img/doi`


