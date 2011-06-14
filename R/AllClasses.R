setClass("GeneClusterSet", representation(GeneClusters="list"))

setClass("GeneSet", representation(GeneSet1="character", GeneSet2="character"))

setClass("GOSet", representation(GOSet1="character", GOSet2="character"))

setClass(Class="Params", 
	representation(ontology="character", organism="character", method="character", combine="character", dropCodes="character"),
	prototype=prototype (dropCodes="NULL")
)


