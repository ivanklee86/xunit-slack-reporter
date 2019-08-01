import os
import sys
import pathlib
import app.constants as constants
import app.utils.xunit_utils as xunit_utils
import app.utils.slack_utils as slack_utils


def main():
    # Load XUnit report
    if constants.XUNIT_PATH_ENV_VAR not in os.environ:
        raise Exception(f"xunit file not found!  Please make sure to set the {constants.XUNIT_PATH_ENV_VAR} env variable!")
    else:
        try:
            xunit_path = os.getenv(constants.XUNIT_PATH_ENV_VAR)
            xunit_report = xunit_utils.read_xunit(pathlib.Path(xunit_path))
        except Exception as e:
            raise Exception(f"Error loading xunit file!  Error: {e}")

    # Slack results
    slack_attachment = {
        "color": constants.PASS_COLOR,
        "author_name": "XUnit Slack Reporter",
        "author_link": "https://github.com/ivanklee86/xunit-slack-reporter",
        "title": f"XUnit test results for {os.getenv('GITHUB_WORKFLOW')} on {os.getenv('GITHUB_REF')}",
        "fields": []
    }

    if xunit_report.errors or xunit_report.failures:
        slack_attachment['color'] = constants.FAIL_COLOR

    slack_attachment['fields'].append({
        "title": "Total # of tests",
        "value": f"{xunit_report.tests}",
        "short": False
    })

    slack_attachment['fields'].append({
        "title": "Tests passed:",
        "value": f"{xunit_report.tests - xunit_report.errors - xunit_report.failures}",
        "short": False
    })

    slack_attachment['fields'].append({
        "title": "Tests errored:",
        "value": f"{xunit_report.errors}",
        "short": False
    })

    slack_attachment['fields'].append({
        "title": "Tests failed:",
        "value": f"{xunit_report.failures}",
        "short": False
    })

    slack_attachment['fields'].append({
        "title": "Time elapsed:",
        "value": f"{xunit_report.time} seconds",
        "short": False
    })

    slack_utils.send_slack_msg(
        os.getenv("SLACK_CHANNEL"),
        attachments=[slack_attachment]
    )

    # Return appropriate status code.
    if os.getenv("EXIT_CODE_FROM_REPORT"):
        if xunit_report.errors or xunit_report.failures:
            sys.exit(1)

if __name__ == "__main__":
    main()
