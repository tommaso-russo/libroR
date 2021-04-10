# Estrae e fa una prima pulizia i comandi R presenti nel file tex della cartella
#  superiore. I comandi vengono riportati nel file 'Script.R'.
testo = readLines('../Slides.tex')
segno = grep('> ', testo)
nRows = length(segno)
# testo[segno]
file.create('Script.R')
for(iRow in 1:nRows){
 riga = testo[segno[iRow]]
# if(length(strsplit(riga, '> ')[[1]]) == 2) riga = strsplit(riga, '> ')[[1]][2]
 if(substr(riga, 1, 2) == '> '){
  riga = substr(riga, 3, nchar(riga))
  if(substr(riga,1,1)==' ') riga = substr(riga, 2, nchar(riga))
  # while(substr(riga, nchar(riga), nchar(riga)) == '\\') riga = substr(riga,1,nchar(riga)-1)
  # if(substr(riga, nchar(riga), nchar(riga))=='}') riga = substr(riga, 1, nchar(riga)-1)
  # if(substr(riga, nchar(riga), nchar(riga)) == '+') riga = substr(riga,1,nchar(riga)-1)
  if(substr(riga, nchar(riga), nchar(riga))==' ') riga = substr(riga, 1, nchar(riga)-1)
  cat(riga, sep='\n', file='Script.R', append=T)
 }
}
