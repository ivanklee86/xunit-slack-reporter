from tests.utils.fixtures import test_provisioning  # noqa: 401
from app.utils.slack_utils import send_slack_msg


def test_sendslackmsg(test_provisioning):  # noqa: F811
    send_slack_msg(
        slack_channel="C5BMKV7EV",
        message="i r in ur slackbots hax0ring ur wallets"
    )
