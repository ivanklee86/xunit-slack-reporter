import pytest
from dotenv import load_dotenv
from tests.utils.xunit_files import PYTEST_SUCCESS, PYTEST_FAILURE, MOCHA_SUCCESS


@pytest.fixture()
def test_provisioning():
    load_dotenv()


@pytest.fixture(
    params=[PYTEST_FAILURE, PYTEST_SUCCESS, MOCHA_SUCCESS]
)
def xunit_file(request):
    yield request.param
