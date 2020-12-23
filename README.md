# DataDriven_Attack

## Project.R

Fichero en R que construye el dataframe en crudo de MITRE ATTACK a partir de un JSON.

## Explicación del schema

* Type
** The types within this JSON are the following (as well as the common wording used for this type):
*** attack-pattern (Techniques)
*** relationship (This is a unique type that contains relationships between types)
*** course-of-action (Mitigations)
*** identity (unused)
*** intrusion-set (Actors or Groups)
*** malware (Malware)
*** tool (Tools)
*** x-mitre-tactic (Tactics)
*** x-mitre-matrix (MITRE ATT&CK MATRIX)(unused)
*** marking-definition (unused)
