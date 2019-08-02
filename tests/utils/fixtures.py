import pytest
from dotenv import load_dotenv
from tests.utils.xunit_files import PYTEST_SUCCESS_PATH, PYTEST_FAILURE_PATH, MOCHA_SUCCESS_PATH


@pytest.fixture()
def test_provisioning():
    load_dotenv()


@pytest.fixture(
    params=[PYTEST_FAILURE_PATH, PYTEST_SUCCESS_PATH, MOCHA_SUCCESS_PATH]
)
def xunit_file(request):
    yield request.param
