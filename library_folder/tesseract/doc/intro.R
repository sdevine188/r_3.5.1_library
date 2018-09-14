## ---- echo = FALSE, message = FALSE---------------------------------------------------------------
knitr::opts_chunk$set(comment = "")
options(width = 100, max.print = 100)
has_nld <- "nld" %in% tesseract::tesseract_info()$available

## -------------------------------------------------------------------------------------------------
library(tesseract)
eng <- tesseract("eng")
text <- tesseract::ocr("http://jeroen.github.io/images/testocr.png", engine = eng)
cat(text)

## -------------------------------------------------------------------------------------------------
results <- tesseract::ocr_data("http://jeroen.github.io/images/testocr.png", engine = eng)
print(results, n = 20)

## -------------------------------------------------------------------------------------------------
tesseract_info()

## ---- eval=FALSE----------------------------------------------------------------------------------
#  tesseract_download("nld")

## ----eval = has_nld-------------------------------------------------------------------------------
(dutch <- tesseract("nld"))
text <- ocr("https://jeroen.github.io/images/utrecht.png", engine = dutch)
cat(text)

## -------------------------------------------------------------------------------------------------
library(magick)
input <- image_read("https://jeroen.github.io/images/bowers.jpg")

text <- input %>%
  image_resize("2000x") %>%
  image_convert(type = 'Grayscale') %>%
  image_trim(fuzz = 40) %>%
  image_write(format = 'png', density = '300x300') %>%
  tesseract::ocr() 

cat(text)

## ---- eval=require(pdftools)----------------------------------------------------------------------
pngfile <- pdftools::pdf_convert('https://jeroen.github.io/images/ocrscan.pdf', dpi = 600)
text <- tesseract::ocr(pngfile)
cat(text)

## -------------------------------------------------------------------------------------------------
# List all parameters with *colour* in name or description
tesseract_params('colour')

## -------------------------------------------------------------------------------------------------
numbers <- tesseract(options = list(tessedit_char_whitelist = "$.0123456789"))
cat(ocr("https://jeroen.github.io/images/receipt.png", engine = numbers))

## -------------------------------------------------------------------------------------------------
# Do not allow any dollar sign 
numbers2 <- tesseract(options = list(tessedit_char_whitelist = ".0123456789"))
cat(ocr("https://jeroen.github.io/images/receipt.png", engine = numbers2))

