# DataDriven_Attack

## Project.R

Fichero en R que construye el dataframe en crudo de MITRE ATTACK a partir de un JSON.

## Explicación del schema e identificadores

#### Type: Identifica el tipo u "origen" de un ataque. 
The types within this JSON are the following (as well as the common wording used for this type):
* attack-pattern (Techniques)
* relationship (This is a unique type that contains relationships between types)
* course-of-action (Mitigations)
* identity (unused)
* intrusion-set (Actors or Groups)
* malware (Malware)
* tool (Tools)
* x-mitre-tactic (Tactics)
* x-mitre-matrix (MITRE ATT&CK MATRIX)(unused)
* marking-definition (unused)

#### Revoked
Indica si esta parchead/solucionado o no (TRUE, FALSE)

## Modified y created. 
El primero de ellos indica la fecha de la última modificaciuón mientras que el último indica la fecha de la primera interacción o primer "avistamiento". Por simplicidad, el más interesante es el modified. En el peor de los casos, la fecha coincidirá con la de creación y, sino, tendremos la fecha del último cambio. 

## Description
Se indica coómo se procede con ese ataque.; cómo lo van a lanzar.

## x_mitre_permission_required
Qué permisos/usuario son necesarios para ejecutar el ataque. 

## x_mitre_detection
Indica cómo detectar el ataque. 

## x_mitre_data_sources
Indica dónde se puede encontrar o dónde afecta dicho ataque. 

## x_mitre_platform
Indica sobre qué plataformas se puede llevar a cabo o afecta el ataque. 

## x_mitre_system_requirements
Algun requisitio extra propio del sistema como por ejemplo, *Valid Domain account*...

## x_mitre_defense_bypassed
Indica si es necesario bypassear algun sistema o funcionalidad


## Variables interesantes
- Id
- Name
- Source URL. 
- Revoked. **Indica si está "solucinoado"/parcheado"
- Type. Identifica el tipo u "origen" de un ataque. 
- Modified
- Description
- x_mitre_version
- x_mitre_permission_required
- x_mitre_detection
- x_mitre_data_sources
- x_mitre_platform
- x_mitre_system_requirements




