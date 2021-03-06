# Makefile for cog work.

.PHONY: clean sterile test kit pypi testpypi publish

clean:
	-rm -rf build
	-rm -rf dist
	-rm -f MANIFEST
	-rm -f *.pyc */*.pyc */*/*.pyc */*/*/*.pyc
	-rm -f *.pyo */*.pyo */*/*.pyo */*/*/*.pyo
	-rm -f *$$py.class */*$$py.class */*/*$$py.class */*/*/*$$py.class
	-rm -rf __pycache__ */__pycache__ */*/__pycache__
	-rm -f *.bak */*.bak */*/*.bak */*/*/*.bak
	-rm -f .coverage .coverage.* coverage.xml
	-rm -rf cogapp.egg-info htmlcov

sterile: clean
	-rm -rf .tox*
	-rm -rf .pytest_cache .mutmut-cache

test:
	tox

kit:
	python setup.py sdist bdist_wheel
	twine check dist/*

pypi:
	twine upload dist/*

testpypi:
	twine upload --repository testpypi dist/*

WEBHOME = ~/web/stellated/pages/code/cog

publish:
	cp -v *.px $(WEBHOME)
