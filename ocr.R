library(tesseract)
library(magick)
library(pdftools)
tesseract_info()

por <- tesseract("por")
pngfile <- pdftools::pdf_convert('C:/ta/arquivos_procuracao/ALSCO.pdf', dpi = 600)
text2 <- tesseract::ocr(pngfile, engine = por)
cat(text2)


input <- image_read(pngfile)
text3 <- input %>%
  image_resize("2000x") %>%
  image_convert(type = 'Grayscale') %>%
  image_trim(fuzz = 40) %>%
  image_write(format = 'png', density = '300x300') %>%
  tesseract::ocr() 

cat(text3)

