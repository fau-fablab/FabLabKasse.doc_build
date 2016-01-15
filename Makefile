default:
	# actual build:
	git submodule update --init --remote --recursive
	
	# NOTE: `make` changes back to the current dir after every line
	
	# generate uic_generated classes
	cd FabLabKasse/FabLabKasse/UI/ && ./compile_all.py
	# create docs
	cd FabLabKasse/doc/ && make html
	
	# save to output
	mkdir -p ./output
	rsync --delete --recursive FabLabKasse/doc/_build/html/ ./output/
clean:
	rm -fr output
	cd FabLabKasse/doc/ && make clean
