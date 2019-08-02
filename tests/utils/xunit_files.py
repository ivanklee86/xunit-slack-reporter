import os
from pathlib import Path

local_dir = Path(__file__).parent.absolute()

PYTEST_SUCCESS_FILE = os.path.join(local_dir, "files", "pytest-success.xml")
PYTEST_FAILURE_FILE = os.path.join(local_dir, "files", "pytest-failure.xml")
MOCHA_SUCCESS_FILE = os.path.join(local_dir, "files", "mocha-success.xml")

PYTEST_SUCCESS_PATH = Path(PYTEST_SUCCESS_FILE)
PYTEST_FAILURE_PATH = Path(PYTEST_FAILURE_FILE)
MOCHA_SUCCESS_PATH = Path(MOCHA_SUCCESS_FILE)