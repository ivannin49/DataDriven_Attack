attack.src <- tempfile(fileext = ".json")

download.file(url = "https://raw.githubusercontent.com/mitre/cti/master/enterprise-attack/enterprise-attack.json",destfile = attack.src)

raw.attack <- jsonlite::fromJSON(attack.src)

objects.raw <- raw.attack$objects

objects.external_references.raw <- data.frame(t(raw.attack$objects$external_references))
#objects.external_references.raw <- raw.attack$objects$external_references
objects.raw[,'external_references'] <- NULL

objects.raw <- objects.raw[,colSums(is.na(objects.raw))<nrow(objects.raw)]

# No hace falta revisar si todas son NULL porque en R si todas las rows de una misma columna son NULL, toda esa col. se borra.

# Functions

#---------- Functions for parser -------------------

extract_source_name <- function(i){
  objects.external_references.raw[,i][[1]]$source_name
  #objects.external_references.raw[[i]]['source_name']
}
extract_external_id <- function(i){
  objects.external_references.raw[,i][[1]]$external_id
}
extract_url <- function(i){
  objects.external_references.raw[,i][[1]]$url
}
extract_description <- function(i){
  objects.external_references.raw[,i][[1]]$description
}

i <- length(objects.external_references.raw)
source_name <- lapply(1:i,extract_source_name)
source_external_id <- lapply(1:i,extract_external_id)
source_url <- lapply(1:i,extract_url)
source_description <- lapply(1:i,extract_description)

#Funciones para convertir a String
toString_source_name <- function(i){
  toString(source_name[[i]])
}

toString_source_external_id <- function(i){
  toString(source_external_id[[i]])
}

toString_source_url <- function(i){
  toString(source_url[[i]])
}

toString_source_description <- function(i){
  toString(source_description[[i]])
}

source_name <- lapply(1:i,toString_source_name)
source_external_id <- lapply(1:i,toString_source_external_id)
source_url <- lapply(1:i,toString_source_url)
source_description <- lapply(1:i,toString_source_description)

#Construción del DataFrame
df_source_name <- data.frame(matrix(unlist(source_name), nrow=length(source_name), byrow=T),stringsAsFactors=FALSE)
colnames(df_source_name)[1] <- 'source_name'


df_source_external_id <- data.frame(matrix(unlist(source_external_id), nrow=length(source_external_id), byrow=T),stringsAsFactors=FALSE)
colnames(df_source_external_id)[1] <- 'source_external_id'

df_source_url <- data.frame(matrix(unlist(source_url), nrow=length(source_url), byrow=T),stringsAsFactors=FALSE)
colnames(df_source_url)[1] <- 'source_url'

df_source_description <- data.frame(matrix(unlist(source_description), nrow=length(source_description), byrow=T),stringsAsFactors=FALSE)
colnames(df_source_description)[1] <- 'description_sn'

# Orden y creación definitiva del data frame


aux <- dplyr::select(objects.raw,(1:2))
aux <- cbind(aux,df_source_name,df_source_external_id,df_source_url,df_source_description)
df_objects <- cbind(aux,dplyr::select(objects.raw,(3:length(objects.raw))))
