# server.py

from mcp.server.fastmcp import FastMCP
from tools import get_alerts, get_forecast

# Initialize FastMCP server
mcp = FastMCP("weather")

# Attach tools
# mcp.add_tool(get_alerts, name="Get-Weather-Alerts", description="TOOL DESC")
mcp.add_tool(get_alerts)
# mcp.add_tool(get_forecast, name="Get-Forecast", description="TOOL DESC")
mcp.add_tool(get_forecast)

if __name__ == "__main__":
    #Run the server
    mcp.run(transport='stdio')