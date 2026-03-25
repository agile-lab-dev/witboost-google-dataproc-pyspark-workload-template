import "strings"

let splits = strings.Split(id, ":")
let domainId = splits[3]
let majorVersion = splits[5]

#ComponentId:    string & =~"^urn:dmb:cmp:\(domainId):[a-zA-Z0-9_\\-]+:\(majorVersion):[a-zA-Z0-9_\\-]+$"
#NonEmptyString: string & =~"^.+$"
#KebabString:    string & =~"^[a-z0-9][a-z0-9-]*$"
#Email:          string & =~"^[^@\\s]+@[^@\\s]+\.[^@\\s]+$"
#Version:        string & =~"^[A-Za-z0-9-]+(?:\\.[A-Za-z0-9-]+){2}$"
#UrnLike:        string & =~"^(urn:|[a-z0-9-]+:[a-z0-9-]+/).+$"
#PythonFilePath: string & =~"^.+\\.py$"
#JarFile:        string & =~"^.+\\.jar$"
#Region:         string & =~"^[a-z]+(?:-[a-z0-9]+)+[0-9]$"

#MachineType:
	"n2-standard-2" |
	"n2-standard-4" |
	"n2-standard-8" |
	"n2-standard-16" |
	"n2-standard-32" |
	"e2-standard-2" |
	"e2-standard-4" |
	"e2-standard-8" |
	"e2-medium" |
	"e2-highmem-2" |
	"e2-highmem-4" |
	"n2-highmem-2" |
	"n2-highmem-4" |
	"n2-highmem-8" |
	"n2-highmem-16" |
	"n2-highmem-32"

#PersistentDiskType: "Standard Persistent Disk" | "SSD Persistent Disk"

#StringList: [...#NonEmptyString]
#NonEmptyStringList: [#NonEmptyString, ...#NonEmptyString]

#ClusterNodeGroup: {
	count:             int & >=0
	machineType:       #MachineType
	primaryDiskSizeGB: int & >0
	primaryDiskType:   #PersistentDiskType
	numLocalSsd:       int & >=0 & <=8
}

id!:                       #ComponentId
name!:                     #NonEmptyString
fullyQualifiedName?:       string | null
description!:              #NonEmptyString
kind!:                     "workload"
version!:                  #Version
infrastructureTemplateId!: #UrnLike
useCaseTemplateId!:        #UrnLike
dependsOn?:                [...string]
platform!:                 "GCP"
technology!:               "Spark"
readsFrom?:                [...string]
tags:                      []
specific: {
	timeToLive!:           int & >0
	projectId!:            #NonEmptyString
	region!:               #Region
	workflowTemplateName!: #KebabString
	artifact: {
		name!:                     #NonEmptyString
		version!:                  #NonEmptyString
		gcsInternalStorageAreaId!: #UrnLike
	}
	job: {
		type!:                  "PYSPARK"
		mainPythonFile!:        #PythonFilePath
		additionalPythonFiles?: [...#PythonFilePath]
		jarFiles?:              [...#JarFile]
		args?:                  #StringList
	}
	cluster: {
		imageVersion: #NonEmptyString
		name?:        #KebabString
		serviceAccount?: #Email
		masters?: #ClusterNodeGroup & {
			count: int & >=1
		}
		workers?: #ClusterNodeGroup
		secondaryWorkers?: {
			count: int & >=0
		}
	}
}


