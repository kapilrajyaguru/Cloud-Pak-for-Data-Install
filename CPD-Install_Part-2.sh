#Encode the username and password using Base64 encoding. 

echo -n "cp:entitlement-key" | base64 -w0             #Replace entitlement-key with your entitlement key.

# Add an entry for the container registry to the auths section in the .dockerconfigjson file. replace the value of base64-encoded-credentials with the actual value you got from above command.

vi .dockerconfiguration

{
   "auths":{
       1 "cp.icr.io":{
         "auth":"base64-encoded-credentials",
         "email":"not-used"
      },
       2 "myregistry.example.com":{
         "auth":"b3Blb=",
         "email":"not-used"
      }
   }
}

Apply new configuration

oc set data secret/pull-secret -n openshift-config --from-file=.dockerconfigjson=.dockerconfigjson

