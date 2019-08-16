# xUnit Slack Reporter

Github Action to send xUnit results to Slack.

## What it does!

This action will:
- Parse a xUnit-style XML report.
- Send summary to Slack workspace & channel of your choice.
- (Optional) Fail the build if errors or failures are found.

## What you need!
- A token for a [Slack bot user](https://api.slack.com/bot-users).  I recommend setting up the token as a [secret](https://developer.github.com/actions/managing-workflows/storing-secrets/).
- The [channel ID](https://stackoverflow.com/questions/40940327/what-is-the-simplest-way-to-find-a-slack-team-id-and-a-channel-id) to notify.
 
## Setting up the action
The following environment variables are supported:

Environment Variable | Description | Required? |
---------------------|-------------|-----------|
XUNIT_PATH | Path (relative to workspce directory) to xUnit report | Y |
SLACK_TOKEN | Slack bot user token | Y |
SLACK_CHANNEL | Unique ID of slack channel to notify | Y |
EXIT_CODE_FROM_REPORT | If present, will fail workflow if errors or failures are in the report | N |

Sample Workflow section:
```
action "testsnotify" {
  needs = "tests"
  uses = "ivanklee86/xunit-slack-reporter@master"
  env = {
    SLACK_CHANNEL = "AAAAAAAA"
    XUNIT_PATH = "./results.xml"
    EXIT_CODE_FROM_REPORT = "True"
  },
  secrets = ["SLACK_TOKEN"]
}

```

```.env
    - name: notify-tests
      uses: ./
      env:
        EXIT_CODE_FROM_REPORT: "True"
        SLACK_CHANNEL: CKQ7C7KJN
        SLACK_TOKEN: ${{ secrets.SLACK_TOKEN }}
        XUNIT_PATH: ./results.xml
```