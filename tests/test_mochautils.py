from tests.utils.fixtures import xunit_file  # noqa: 401
import app.utils.xunit_utils as xunit_utils


def test_xunit_parsing(xunit_file):  # noqa: F811
    parsed_data = xunit_utils.read_xunit(xunit_file)

    assert parsed_data.tests > 0
    assert parsed_data.time > 0

    if parsed_data.errors:
        assert parsed_data.errors > 0

    if parsed_data.failures:
        assert parsed_data.failures > 0
