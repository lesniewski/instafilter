test:
	python -m pytest -s tests/

coverage:
	coverage run --source=instafilter -m pytest tests/
	coverage report -m
	coverage html
	xdg-open htmlcov/index.html

lint:
	black instafilter tests train_new_model setup.py --line-length 80
	flake8

clean:
	rm -rvf cover instafilter.egg-info/ htmlcov dist *~

dist_test:
	rm -rvf dist
	python setup.py sdist
	twine upload -r test dist/*

dist_production:
	rm -rvf dist
	python setup.py sdist
	twine upload dist/*
