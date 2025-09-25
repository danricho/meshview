import configparser
import argparse
import json

# Parse command-line arguments
parser = argparse.ArgumentParser(description="MeshView Configuration Loader")
parser.add_argument("--config", type=str, default="config.ini", help="Path to config.ini file (default: config.ini)")
args = parser.parse_args()

# Initialize config parser
config_parser = configparser.ConfigParser()
if not config_parser.read(args.config):
    raise FileNotFoundError(f"Config file '{args.config}' not found! Ensure the file exists.")

CONFIG = {section: dict(config_parser.items(section)) for section in config_parser.sections()}

CONFIG['site']['external_footer_links'] = json.loads(CONFIG['site'].get('external_footer_links', '[]'))
CONFIG['site']['base_map_layers'] = json.loads(CONFIG['site'].get('base_map_layers', '[]'))
CONFIG['site']['broadcast_message_channels'] = json.loads(CONFIG['site'].get('broadcast_message_channels', '[]'))
