DIRS = java-runtime nodejs-runtime

image:
	for d in $(DIRS); do (cd $$d && make image) ; done
