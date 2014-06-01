jlang
=====

debian packaging for j

Because http://jsoftware.com/pipermail/source/2014-May/000547.html

Note that I am ignoring the dh mechanisms. I am disappointed in
the state of debian documentation on its file formats. The information
is too dispersed. So the initial drafts here, at least, should be
informative and might perhaps inspire some better documentation.

Also, the amount of code here is trivial, and I dislike toolchain
sprawl. There's something to be said for standardization and good
tools, but they must be accompanied by people that understand
how things work, and that's not happening if the docs aren't
there.

To build the debian packages, use dpkg-buildpackage from the
command line, within the jlang-*/ directory.
