#Login to Red Hat OpenShift Cluster

oc login -u username -p password https://api.example.com:6443       # Enter your Red Hat Openshift clsuter admin user name and password provide API link to Red Hat OpenShift Cluster https://api.example.com:6443

#Create CPD projects

oc new-project ibm-common-services
oc new-project cpd-operators
oc new-project cpd-instance

#Create the operator group for the IBM Cloud Pak Foundational Services Project.

oc apply -f OperatorGroup.yaml

#Determine whether there is an existing global image pull secret. This command generates a JSON file called .dockerconfigjson in the current directory.

oc extract secret/pull-secret -n openshift-config

