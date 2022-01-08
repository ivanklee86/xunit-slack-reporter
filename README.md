# xUnit Slack Reporter

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-v1.2.0-undefined.svg?logo=github&logoColor=white&style=flat)](https://github.com/marketplace/actions/xunit-slack-reporter)[![CI](https://github.com/ivanklee86/xunit-slack-reporter/actions/workflows/ci.yml/badge.svg)](https://github.com/ivanklee86/xunit-slack-reporter/actions/workflows/ci.yml)[![codecov](https://codecov.io/gh/ivanklee86/xunit-slack-reporter/branch/main/graph/badge.svg?token=PDSK5ZWPKJ)](https://codecov.io/gh/ivanklee86/xunit-slack-reporter)

Github Action to send xUnit results to Slack.

## What it does!

This action will:
- Parse a xUnit-style XML report.
- Send summary to Slack workspace & channel of your choice.
- Supports paths and globs (i.e. `**/*.xml`)!
- (Optional) Only send notifications if errors or failures are found.
- (Optional) Fail the build if errors or failures are found.

## What you need!
- A token for a [Slack bot user](https://api.slack.com/bot-users).  I recommend setting up the token as a [secret](https://developer.github.com/actions/managing-workflows/storing-secrets/).
- The [channel ID](https://stackoverflow.com/questions/40940327/what-is-the-simplest-way-to-find-a-slack-team-id-and-a-channel-id) to notify.
 
## Setting up the action
The following environment variables are supported:

Environment Variable | Example | Description | Required? |
---------------------|---------|-------------|-----------|
XUNIT_PATH | ./results.xml | Path (relative to workspce directory) to xUnit report | Y* |
XUNIT_GLOB | **/*.xml | Glob (relative to workspace directory) to xUnit reports | Y* |
SLACK_TOKEN | (See Slack documentation) | Slack bot user token | Y |
SLACK_CHANNEL | CKQ7C7KJN | Unique ID of slack channel to notify | Y |
EXIT_CODE_FROM_REPORT | True/False | If present, will fail workflow if errors or failures are in the report | N |
ONLY_NOTIFY_ON_ISSUES | True/False | If present, will only send notifications if errors or failures are found | N |

\* = Either XUNIT_PATH or XUNIT_GLOB must be provided.

Sample Workflow section:
```.env
    - name: notify-tests
      uses: ./
      env:
        EXIT_CODE_FROM_REPORT: "True"
        SLACK_CHANNEL: CKQ7C7KJN
        SLACK_TOKEN: ${{ secrets.SLACK_TOKEN }}
        XUNIT_PATH: ./results.xml
```

```.env
    - name: notify-tests
      uses: ./
      env:
        ONLY_NOTIFY_ON_ISSUES: "True"
        SLACK_CHANNEL: CKQ7C7KJN
        SLACK_TOKEN: ${{ secrets.SLACK_TOKEN }}
        XUNIT_PATH: **/*.xml
```