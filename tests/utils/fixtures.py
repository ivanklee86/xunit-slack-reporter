import pytest
from dotenv import load_dotenv


@pytest.fixture()
def test_provisioning():
    load_dotenv()
