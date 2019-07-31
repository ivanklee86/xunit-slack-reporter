import os
from pathlib import Path

local_dir = Path(__file__).parent.absolute()

PYTEST_SUCCESS = Path(os.path.join(local_dir, "files", "pytest-success.xml"))
PYTEST_FAILURE = Path(os.path.join(local_dir, "files", "pytest-failure.xml"))
MOCHA_SUCCESS = Path(os.path.join(local_dir, "files", "mocha-success.xml"))