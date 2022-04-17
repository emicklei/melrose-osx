HERE := $(shell pwd)
SRC  := ../melrose
LATEST_TAG := $(shell cd ${SRC} && git describe --abbrev=0)
APP  := /Applications/Melrose

package: clean build  
	# prepare target, build results is already in target
	# cp /usr/lib/libSystem.B.dylib target
	# cp /usr/lib/libc++.1.dylib target
	echo "$(LATEST_TAG)" > target/version.txt

	# copy to APP
	rm -rf $(APP)
	mkdir -p $(APP)	
	cp *.sh $(APP)
	cp target/* $(APP)
	
	# package it up
	/usr/local/bin/packagesbuild --package-version "$(LATEST_TAG)" Melrose.pkgproj
	mv Melrose.pkg "Melrose-$(LATEST_TAG).pkg"

build: 
	cd $(SRC)/cmd/melrose && go build -ldflags "-s -w -X main.BuildTag=$(LATEST_TAG)" -o $(HERE)/target/melrose

clean:
	rm -rf target
	mkdir target

show:
	echo $(HERE)
	echo $(LATEST_TAG)