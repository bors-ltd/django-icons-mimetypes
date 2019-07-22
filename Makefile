PACKAGE=icons_mimetypes

all:

clean:
	find $(PACKAGE) tests "(" -name "*.pyc" -or -name "*.pyo" -or -name "*.mo" -or -name "*.so" ")" -delete
	find $(PACKAGE) tests -type d -empty -delete
	find $(PACKAGE) tests -name __pycache__ -delete

docs:
	rst2html.py README.rst > README.html

test: clean
	python manage.py test

coverage: clean
	coverage erase
	coverage run --source=$(PACKAGE) manage.py test --noinput
	coverage html

release: test
	python setup.py sdist

.PHONY: clean docs test coverage release
