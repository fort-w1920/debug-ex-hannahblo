# Lösung: Scatterhist

####### a)
# Der Auslöser des Fehlers ist die Plot-Funktion. 
# Der Dataframe hat 3 Spalten. Dadurch werden mehrere Plots erzeugt, die aber
# gemeinsam keine Achsenbeschriftung besitzen. Dies wird aber durch xlab = "" 
# und ylab = "" suggeriert.

###### b)
# Sobald der Debugger in der Zeile 7 im scatterhist-start.R File bei
# (y <- hist(x[, 1], breaks = xbreaks, plot = FALSE) ist, aber diese noch nicht
# ausgeführt hat, kann durch überschreiben von (x) mit (x <- x^2) die Werte 
# quadriert werden.

##### c)
# Schreibe in Zeile 6 im scatterhist-start.R File: browser()



