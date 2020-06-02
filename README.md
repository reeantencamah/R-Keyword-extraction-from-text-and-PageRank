# R-Keyword extraction from text and calculate PageRank based on a query
Data Analytics, Text mining, R, Ontology 

-The purpose of this project is to connect an ontology(from Protégé) to RStudio and retrieve the details of each class of the ontology on which we have analysed and retrived 5 keywords for each class using tf–idf and also calculate the page rank based on a query search using cosine distance. 

-Keyword extraction
Keyword extraction is tasked with the automatic identification of terms that best describe the subject of a document. Key phrases, key terms, key segments or just keywords are the terminology which is used for defining the terms that represent the most relevant information contained in the document.

Ex.
For the class "food", the 5 keywords extracted are "vitamin","food","humans","protein" and "fiber".

-Library used in RStudio
ontologyIndex_ to read the ontology
tm_ to perform data mining
snowballC_ used to perform stemming

-Steps:
_Read all the data on the ontology and classify them in their appropriate classes.
_Convert all classes as a list
_COnvert the list to Corpus
_Perform text preprocessing
_Perform Stemming
_Apply tf-idf
_Calculate page rank
_Display Results

-Source Code is provided
