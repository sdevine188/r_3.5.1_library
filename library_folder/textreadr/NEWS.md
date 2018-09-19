NEWS
====

Versioning
----------

Releases will be numbered with the following semantic versioning format:

&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor
  and patch)
* New additions without breaking backward compatibility bumps the minor
  (and resets the patch)
* Bug fixes and misc changes bumps the patch



textreadr 0.8.0 -
----------------------------------------------------------------

**BUG FIXES**

**NEW FEATURES**

**MINOR FEATURES**

**IMPROVEMENTS**

**CHANGES**



textreadr 0.6.0 - 0.7.0
----------------------------------------------------------------

**BUG FIXES**

* `read_dir` did not handle errored readins correctly resulting in an R error.

**NEW FEATURES**

* `read_document` picks up an explicit `skip`, `remove.empty`, and `trim`
  argument like the other `read_` functions.

* `read_rtf` added to the document forms that can be parsed.  This relies on the
  **striprtf** package as a backend.  `read_document` and `read_transcript` pick
  up the ability to read rich text format as well.

**MINOR FEATURES**

* `as_transcript` added for coercion of internal strings to transcript.  This
  function adds the ability to call out the person variable via a regex.  For
  example one may split after all caps as the leading string.

* `read_dir` and `read_dir_transcript` pick up an `ignore.case` function for pattern.
  Pattern becomes more powerful in that it was moved outside of the `dir` command
  via a `grep` call.



textreadr 0.4.0 - 0.5.1
----------------------------------------------------------------

**BUG FIXES**

* The README.md called for `ex_` functions from **qdapRegex**.  This was the dev
  version of **qdapRegex**.  This is now the CRAN version and now works for users.

**NEW FEATURES**

* `read_html` added for reading in the text from the body of .html documents.
  `read_document` inherits this ability as well.

**MINOR FEATURES**

* The low level read functions all now have consistent arguments: `skip`,
  `remove.empty`, & `trim` to make their use more interoperable.

**IMPROVEMENTS**

* **textreadr** no longer uses the **antiword** program directly, instead the
  R antiword package is called for `read_doc`.  This makes installation across
  operating systems more standardized.

**CHANGES**

* The logo has been moved to tools to conform to CRAN standards.

* `read_doc`'s argument `format` is now `FALSE` by default rather than `TRUE` to
  be consistent with the other read functions.

* `read_docx` no longer uses the **XML** package but now uses **xml2** as
  suggested by Jeroen Ooms (see <a href="https://github.com/trinker/textreadr/issues/7">issue #7</a>).



textreadr 0.3.1
----------------------------------------------------------------

**NEW FEATURES**

* `read_dir_transcript` added to complement `read_dir` aimed at a directory of
  transcripts.



textreadr 0.0.1 - 0.3.0
----------------------------------------------------------------

This package is a  collection of convenience tools for reading text documents
into R.