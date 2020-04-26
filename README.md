# деплой в openshift
oc new-app . 
oc expose pod go-example-XXX --port=8080 
oc expose service go-example 
oc get routes 
