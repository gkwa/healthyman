run: healthyman
	./healthyman

healthyman: ./dist/healthyman_darwin_amd64_v1/healthyman
	cp $< $@

./dist/healthyman_darwin_amd64_v1/healthyman: main.go cmd/*.go
	gofumpt -w $<
	goreleaser build --single-target --snapshot --clean

clean:
	rm -f healthyman
	rm -rf dist
