from pathlib import Path
from junitparser import JUnitXml  # type: ignore


def read_xunit(xunit_report_path: Path):
    return JUnitXml.fromfile(xunit_report_path)
