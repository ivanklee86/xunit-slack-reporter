import pytest
from app import script, constants
from tests.utils import xunit_files
from tests.utils.fixtures import test_provisioning  # noqa: 401


def test_main_pytestsuccess(monkeypatch, test_provisioning, mocker):  # noqa: F811
    monkeypatch.setenv("XUNIT_PATH", xunit_files.PYTEST_SUCCESS_FILE)
    monkeypatch.setenv("GITHUB_WORKFLOW", "Unit Test")
    monkeypatch.setenv("GITHUB_REF", "Unit Test")
    slack_mock = mocker.patch("app.utils.slack_utils.send_slack_msg")

    script.main()

    assert slack_mock.called
    assert slack_mock.call_count == 1
    assert slack_mock.call_args[1]['attachments'][0]['color'] == constants.PASS_COLOR
    assert len(slack_mock.call_args[1]['attachments'][0]['fields']) == 5


def test_main_pytestfailure(monkeypatch, test_provisioning, mocker):  # noqa: F811
    monkeypatch.setenv("XUNIT_PATH", xunit_files.PYTEST_FAILURE_FILE)
    monkeypatch.setenv("GITHUB_WORKFLOW", "Unit Test")
    monkeypatch.setenv("GITHUB_REF", "Unit Test")
    slack_mock = mocker.patch("app.utils.slack_utils.send_slack_msg")

    script.main()

    assert slack_mock.called
    assert slack_mock.call_count == 1
    assert slack_mock.call_args[1]['attachments'][0]['color'] == constants.FAIL_COLOR
    assert len(slack_mock.call_args[1]['attachments'][0]['fields']) == 5


def test_main_mochasuccess(monkeypatch, test_provisioning, mocker):  # noqa: F811
    monkeypatch.setenv("XUNIT_PATH", xunit_files.MOCHA_SUCCESS_FILE)
    monkeypatch.setenv("GITHUB_WORKFLOW", "Unit Test")
    monkeypatch.setenv("GITHUB_REF", "Unit Test")
    monkeypatch.setenv("EXIT_CODE_FROM_REPORT", "True")
    slack_mock = mocker.patch("app.utils.slack_utils.send_slack_msg")

    script.main()

    assert slack_mock.called
    assert slack_mock.call_count == 1
    assert slack_mock.call_args[1]['attachments'][0]['color'] == constants.PASS_COLOR
    assert len(slack_mock.call_args[1]['attachments'][0]['fields']) == 5


def test_main_systemexit_failure(monkeypatch, test_provisioning, mocker):  # noqa: F811
    monkeypatch.setenv("XUNIT_PATH", xunit_files.PYTEST_FAILURE_FILE)
    monkeypatch.setenv("GITHUB_WORKFLOW", "Unit Test")
    monkeypatch.setenv("GITHUB_REF", "Unit Test")
    monkeypatch.setenv("EXIT_CODE_FROM_REPORT", "True")
    slack_mock = mocker.patch("app.utils.slack_utils.send_slack_msg")

    with pytest.raises(SystemExit) as pytest_wrapped_e:
        script.main()

    assert slack_mock.called
    assert slack_mock.call_count == 1
    assert slack_mock.call_args[1]['attachments'][0]['color'] == constants.FAIL_COLOR
    assert len(slack_mock.call_args[1]['attachments'][0]['fields']) == 5
    assert pytest_wrapped_e.type == SystemExit
    assert pytest_wrapped_e.value.code == 1
