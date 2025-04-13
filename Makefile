# Variables
VERSION ?= $(error "Please provide the version with VERSION=1.2.3 (e.g., make release VERSION=1.2.3)")
# The version to be released
# This is the version that will be used in the release process
TAG = v$(VERSION)
PYPROJECT = pyproject.toml

# Location of the version bump script
BUMP_SCRIPT = scripts/bump_version.py

# Regular expression for semantic versioning (MAJOR.MINOR.PATCH)
SEMVER_REGEX = ^[0-9]+\.[0-9]+\.[0-9]+$$

.PHONY: bump commit tag push release check validate_version lint test quality

## Validate semantic versioning (MAJOR.MINOR.PATCH)
validate_version:
	@echo "🔍 Validating version format: $(VERSION)"
	@if ! echo "$(VERSION)" | grep -Eq "$(SEMVER_REGEX)"; then \
		echo "❌ Invalid version format: '$(VERSION)' — expected format: MAJOR.MINOR.PATCH (e.g., 1.2.3)"; \
		exit 1; \
	fi

## Update pyproject.toml version
bump: validate_version
	@echo "Updating $(PYPROJECT) to version $(VERSION)"
	python $(BUMP_SCRIPT) v$(VERSION)

## Commit the updated version
commit:
	@git add $(PYPROJECT)
	@git commit -m "release: version $(VERSION)"

## Create a Git tag
tag:
	@git tag v$(VERSION)

## Push branch and tag to remote
push:
	@git push origin HEAD
	@git push origin v$(VERSION)

## Check the current version in pyproject.toml
check:
	@echo "🔍 Checking version in $(PYPROJECT)"
	@grep '^version =' $(PYPROJECT)

## Run code quality checks with pylint
lint:
	@echo "Running pylint for code quality checks..."
	@pylint ocean4dvarnet

## Run unit tests with pytest
test:
	@echo "Running tests with pytest..."
	@pytest

## Run both lint and test
quality: lint test
	@echo "Code quality and tests completed successfully."

## Run full release workflow: bump, check, commit, tag, push
release: bump check commit tag push
	@echo "Release v$(VERSION) completed."
