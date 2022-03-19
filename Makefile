build: Dockerfile
	docker build -t absps/md2pdf .

run:
	docker run -it --rm --hostname md2pdf --name md_container -v <your_directory>:/root absps/md2pdf

push:
	docker push absps/md2pdf

clean:
	rm -rf *~

