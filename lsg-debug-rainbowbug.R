# Lösung rainbowbug

####### a
# Auslöser des Fehlers:
# Nach der Ausführung von 'traceback()' ist 'as.graphicsAnnot(legend)' der
# Auslöser

# Ursache des Fehlers:
# Die Funktion fbag, versucht legende zu setzen, da per Default plotlegend=TRUE
# gesetzt wurde.

# Lösung des Fehlers:
# füge 'plotlegend = FALSE' als Argument zur fboxplot-Funktion.

###### b
# Im Code könnte man statt per Default immer die Legende mit plotten zu lassen,
# durch 'plotlegend = FALSE' als Default, die Legende nur wenns ausdrücklich
# erwünscht ist plotten.