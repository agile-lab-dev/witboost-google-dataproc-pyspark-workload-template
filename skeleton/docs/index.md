## Component metadata

| Field Name               | Value                                                                                                                  |
|:-------------------------|:-----------------------------------------------------------------------------------------------------------------------|
| **Name**                 | ${{ values.name }}                                                                                                     |
| **Description**          | ${{ values.description }}                                                                                              |
| **Domain**               | ${{ values.domain }}                                                                                                   |
| **Parent**               | ${{ values.dataproduct }}                                                                                              |
| **Identifier**           | ${{ values.identifier }}                                                                                               |
| **Owner**                | ${{ values.owner }}                                                                                                    |
| **Depends On**           | ${{ values.gcsInternalStorageAreaId }}; {% if values.additionalDependsOn | length > 0 %}{% for i in values.additionalDependsOn %} ${{ i }}; {% endfor %}{% else %}{% endif %}    |                           
| **Reads From**           | {% if values.readsFrom | length > 0 %}{% for i in values.readsFrom %} ${{ i }}; {% endfor %}{% else %}[]{% endif %}    |
| **Tags**                 | {% if values.tags | length > 0 %}{% for i in values.tags %} ${{ i }}; {% endfor %}{% else %}[]{% endif %} |                                                                                       

## Google Dataproc Workflow Template deployment information

| Field name      | Example value                                                                                                      |
|:----------------|:-------------------------------------------------------------------------------------------------------------------|
| **Project ID**  | This value is generated automatically based on the environment.                                                                                            |
| **Region**     | This value is generated automatically based on the environment.                                                                                            |
| **Time To Live (TTL)**  | This value is generated automatically based on the environment.                                                                                            |
| **Workflow Template Name**  | This value is generated automatically based on the environment.                                                                                            |

### Artifact details

| Field name      | Example value                                                                                                      |
|:----------------|:-------------------------------------------------------------------------------------------------------------------|
| **Name**  | {% if values.artifactName %}${{ values.artifactName }}{% else %}${{ values.identifier.split(".")[0] }}_${{ values.identifier.split(".")[1] }}_${{ values.identifier.split(".")[2] }}_${{ values.identifier.split(".")[3] }}
        {% endif %}                                                                                         |
| **Version**     | This value is generated automatically based on the environment.                                                                                            |
| **GCS Internal Storage Area**  | ${{ values.gcsInternalStorageArea }}                                                                               |

### Job details

| Field name      | Example value                                                                                                      |
|:----------------|:-------------------------------------------------------------------------------------------------------------------|
| **Type**  | PYSPARK                                                                                              |
| **Main Python File**     | ${{ values.mainPythonFile }}                                                                                       |
| **Additional Python Files**  | {% if values.additionalPythonFiles | length > 0 %}{% for i in values.additionalPythonFiles %} ${{ i }}; {% endfor %}{% else %}[]{% endif %}                                                                                                      |
| **Jar Files**  | {% if values.jarFiles | length > 0 %}{% for i in values.jarFiles %} ${{ i }}; {% endfor %}{% else %}[]{% endif %}                                                                                                      |
| **Arguments**  | {% if values.args | length > 0 %}{% for i in values.args %} ${{ i }}; {% endfor %}{% else %}[]{% endif %}                                                                                                      |

### Cluster details

| Field name      | Example value                                                                                                      |
|:----------------|:-------------------------------------------------------------------------------------------------------------------|
| **Name**  | This value is generated automatically based on the environment.                                                                           |
| **Service Account**     | This value is generated automatically based on the environment.                                                                           |
| **Base Image**  |  ${{ values.imageVersion }}                                                                        |


### Master Nodes details

| Field name      | Example value                                                                                                      |
|:----------------|:-------------------------------------------------------------------------------------------------------------------|
| **Count**  | This value is generated automatically based on the environment.                                                                           |
| **Machine Type**     | This value is generated automatically based on the environment.                                                                           |
| **Primary Disk Size (GB)**  |  This value is generated automatically based on the environment.                                                                           |
| **Primary Disk Type**  |  This value is generated automatically based on the environment.                                                                           |
| **Number of local SSD**  |  This value is generated automatically based on the environment.                                                                           |

### Worker Nodes details

| Field name      | Example value                                                                                                      |
|:----------------|:-------------------------------------------------------------------------------------------------------------------|
| **Count**  | This value is generated automatically based on the environment.                                                                           |
| **Machine Type**     | This value is generated automatically based on the environment.                                                                           |
| **Primary Disk Size (GB)**  |  This value is generated automatically based on the environment.                                                                           |
| **Primary Disk Type**  |  This value is generated automatically based on the environment.                                                                           |
| **Number of local SSD**  |  This value is generated automatically based on the environment.                                                                           |
| **Secondary Workers**  |  This value is generated automatically based on the environment.                                                                           |

## Deployment details 

Deploy this component to automatically create or replace a Google Dataproc Workflow Template.