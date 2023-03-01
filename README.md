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
Changes you make will be immediately refreshed in browser.

For the TCLB site:
```bash
hugo --config tclb server
```

## Publishing
Any changes on the `master` branch will be published on the webpages.
All major changes should be done through a Pull Request.

# Structure
The repo is designed to hold data for multiple sites.
Most content should be kept in the common folders.

## Frontmatter and Content
Most of the content is organised in `.md` markdown files (Goldmark). The markdown format is quite standard, with the exception of so-called [shortcodes](https://gohugo.io/content-management/shortcodes/), which can include special content.

The `.md` files have a data segment at the beginning called "front matter". The data is formatted using `YAML` format and should include such things as `title:` or `date:`. In this repo, front matter data is also used to assign content to different categories of different websites.

To assign a page to `publications` and `news` category on the MCF website, add:
```yaml
mcf:
- publications
- news
```

By default a page is visible in all website it was assigned to something. Any reference to them on other websites will be redirected.
If a page is assigned multiple sites, but should be visible only in one, a `sites:` data can be added. For example:
```yaml
title: Some job offer at MCF
mcf:
- news
- jobs
tclb:
- news
- jobs
sites:
- mcf
```
This way, the job offer will be visible in the news on TCLB site, but will redirect to the MCF website.

## `content/people/`
Content about people. The names of the files should be the person id, written lowercase and with `-` in place of spaces (eg. `content/people/l-laniewski-wollk.md`). The person id is: First letter of first name, space and surname. All latin characters.

In the front matter of the `.md` file we need:
```yaml
short: L Laniewski-Wollk          # person ID
title: Łukasz Łaniewski-Wołłk     # full name, the way you like to write it.
tclb: people                      # if you're on TCLB team
mcf: people                       # if you're on MCF team
scopus: '56719775800'             # Scopus ID if you have one (can be a list)
orcid: 0000-0002-3026-5881        # ORCID if you have one
```

In the content you can include the `{{< publist >}}` shortcode to have a publication list.

## `content/doi/`
Content about publications. The names of the files should be named `content/doi/[DOI].md`.

In the front matter of the `.md` file we need:
```yaml
doi: 10.1016/j.camwa.2015.12.043  # DOI
title: Adjoint Lattice Boltzmann for topology optimization on multi-GPU architecture
authors:                          # Author IDs
- L Laniewski-Wollk
- J Rokicki
keywords:                         # Keywords if you want
- adjoint
- lattice boltzmann method
- optimization
date: '2016-02-01'                # Date of publication
journal: Computers and Mathematics with Applications
publisher: Elsevier Ltd
auto_content: yes                                     # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                        # DELETE THIS TO NOT AUTO GENERATE METADATA
redirect: https://doi.org/10.1016/j.camwa.2015.12.043 # DELETE THIS TO NOT REDIRECT
realauthors:                      # This is needed to know how the names on the publication correspond to our IDs
  L Laniewski-Wollk: Ł. Łaniewski-Wołłk
  J Rokicki: J. Rokicki
image: /img/doi/10.1016/j.camwa.2015.12.043/firstpage.png
showonlyimage: yes
```

## `content/posts/`
Main place for general posts.

## `themes/tclb/content/`
Place for TCLB website specific content.

## `themes/mcf/content/`
Place for MCF website specific content.

## `static/`
All static files (like images, data, etc) should be placed here.

## `static/img/`
Place for images. All files here will be visible on the server at `https://domain.name/img/`

## `static/img/doi/`
Place for DOI images. Images should be placed in `static/img/doi/[DOI]/...`

# Automatic generation of DOI data
A lot of data can be harvested from Scopus. The scripts related to that are placed in `auto/` folder.
Please use them with caution and inspect the changes they make.


