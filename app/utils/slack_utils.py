import os
from slack import WebClient


def send_slack_msg(slack_channel: str,
                   message: str = '',
                   attachments: list = None) -> None:
    """
    General purpose function to send one-off Slack messages.

    :param slack_channel: Slack channel for message
    :param message: Message to send to Slack
    :param attachments: Attachments (if desired)
    :return:
    """
    client = WebClient(os.getenv("SLACK_TOKEN", ""))

    client.chat_postMessage(
        channel=slack_channel,
        text=message,
        attachments=attachments,
        as_user=True
    )
