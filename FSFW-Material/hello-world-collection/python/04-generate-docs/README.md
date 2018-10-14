# General Information

The directory `04-generate-docs` is an example for the automatic generation of software documentation
based on docstrings in the source code by means of the tool [Sphinx](http://www.sphinx-doc.org).

The subdirectory `fsfw_demo_package` contains the example code which is to be documented.

The content of the subdirectory `doc` was generated in the following steps:
1. Execution of `sphinx-quickstart`. Thereby some parameters have to be provided interactively (see below).
2. Editing of `doc/source/conf.py`, such that the python package which shall be documented (`fsfw_demo_package`) is in the search path.
3. Execution of `sphinx-apidoc -f -o doc/source fsfw_demo_package/`. This generates the relevant files in the directory `doc/source`.
4. Editing of `doc/source/index.rst` such that these files and intro.rst (created manually) are included.
5. Execution of `make html` inside the directory `doc`. This generates the documentation in HTML format inside `doc/build`.
 (Result: see `doc/build/html/index.html`). *Note*: It might be necessary to run the command `make html` twice.

The content of the manual editing can be retraced, e.g., with the following commands
* `kdiff3 conf.py_original conf.py`
* `kdiff3 index.rst_original index.rst`

More information on this topic is available for example in the  [Sphinx Tutorial](http://www.sphinx-doc.org/en/stable/tutorial.html).
*Note*: Sphinx ca be configured such that code examples contained in docstrings are executed and their results (text, graphics)
are included in the generated docs, e.g., see
[this scipy function](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.bode.html).


## Out- and input of sphinx-quickstart

    Welcome to the Sphinx 1.6.3 quickstart utility.

    ...

    Enter the root path for documentation.
    > Root path for the documentation [.]: doc

    ...

    > Separate source and build directories (y/n) [n]: y

    ...

    > Name prefix for templates and static dir [_]:

    ...

    > Project name: hello-world-autodoc-example
    > Author name(s): FSFW Dresden

    ...

    > Project version []: 1.0
    > Project release [1.0]:

    ...

    > Project language [en]:

    ...

    > Source file suffix [.rst]:

    ...

    > Name of your master document (without suffix) [index]:

    ...

    > Do you want to use the epub builder (y/n) [n]:

    ...

    > autodoc: automatically insert docstrings from modules (y/n) [n]: y
    > doctest: automatically test code snippets in doctest blocks (y/n) [n]:
    > intersphinx: link between Sphinx documentation of different projects (y/n) [n]:
    > todo: write "todo" entries that can be shown or hidden on build (y/n) [n]: y

    > imgmath: include math, rendered as PNG or SVG images (y/n) [n]: n
    > mathjax: include math, rendered in the browser by MathJax (y/n) [n]: n
    > ifconfig: conditional inclusion of content based on config values (y/n) [n]: n
    > viewcode: include links to the source code of documented Python objects (y/n) [n]: n
    > githubpages: create .nojekyll file to publish the document on GitHub pages (y/n) [n]: n

    ...

    > Create Makefile? (y/n) [y]:
    > Create Windows command file? (y/n) [y]:

    Creating file doc/source/conf.py.
    Creating file doc/source/index.rst.
    Creating file doc/Makefile.
    Creating file doc/make.bat.

    Finished: An initial directory structure has been created.

