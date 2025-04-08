# tools.py

from textwrap import dedent
from helpers import make_nws_request, format_alert

NWS_API_BASE = "https://api.weather.gov"

async def get_alerts(state: str) -> str:
    """Get weather alerts for a ID state.

    Args:
        state: Two-letter ID state code (e.g. Bandung, Subang)
    """
    url = f"{NWS_API_BASE}/alerts/active/area/{state}"
    
    # Helper functoin call
    data = await make_nws_request(url)

    if not data or "features" not in data:
        return "Unable to fetch alerts or no alerts found."

    if not data["features"]:
        return "No active alerts for this state."

    # Helper functoin call
    alerts = [format_alert(feature) for feature in data["features"]]
    return "\n---\n".join(alerts)

async def get_forecast(latitude: float, longitude: float) -> str:
    """Get weather forecast for a location.

    Args:
        latitude: Latitude of the location
        longitude: Longitude of the location
    """
    # First get the forecast grid endpoint
    points_url = f"{NWS_API_BASE}/points/{latitude},{longitude}"
    # Helper functoin call
    points_data = await make_nws_request(points_url)

    if not points_data:
        return "Unable to fetch forecast data for this location."

    # Get the forecast URL from the points response
    forecast_url = points_data["properties"]["forecast"]
    # Helper functoin call
    forecast_data = await make_nws_request(forecast_url)

    if not forecast_data:
        return "Unable to fetch detailed forecast."

    # Format the periods into a readable forecast
    periods = forecast_data["properties"]["periods"]
    forecasts = []
    for period in periods[:5]:  # Only show next 5 periods
        forecast = dedent(
            f"""
            {period['name']}:
            Temperature: {period['temperature']}°{period['temperatureUnit']}
            Wind: {period['windSpeed']} {period['windDirection']}
            Forecast: {period['detailedForecast']}
            """
        )
        forecasts.append(forecast)

    return "\n---\n".join(forecasts)